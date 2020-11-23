module Api
    module V1
        class NotesController < ApplicationController
            def index        
                notes =Note.joins(:restaurant, :compte).order('created_at DESC')   

                render json: {status: 'SUCCESS', message: 'Notes chargés', data: notes}, status: :ok
            end      
            
            def show
                note =Note.joins(:restaurant, :compte).find(params[:id])

                render json: {status: 'SUCCESS', message: 'Note chargée', data: restaurant}, status: :ok
            end

            def create
                note= Note.new(note_params)
                
                if(note.save)
                    render json: {status: 'SUCCESS', message: 'Note enregistré', data: note}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Note non enregistré', data: note.errors}, status: :unprocessable_entity
                end
            end

            def update
                note =Note.find(params[:id]) 
                if(note.update_attributes(note_params))
                    render json: {status: 'SUCCESS', message: 'Modification enregistré', data: note}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Modification non enregistré', data: note.errors}, status: :unprocessable_entity
                end
            end

            def destroy         
                note =Restaurant.find(params[:id])   
                note.destroy
                render json: {status: 'SUCCESS', message: 'Note supprimé', data: note}, status: :ok
            end  

            
            private

            def note_params
                params.permit(:adore, :deteste, :restaurant_id, :compte_id)
            end
        end
    end
end