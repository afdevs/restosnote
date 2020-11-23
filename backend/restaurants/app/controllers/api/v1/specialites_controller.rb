module Api
    module V1
        class SpecialitesController < ApplicationController
            def index 
                specialites =Specialite.order('created_at DESC')
                
                render json: {status: 'SUCCESS', message: 'Specialités chargés', data: specialites}, status: :ok
            end

            def show 
                specialite =Specialite.find(params[:id])

                render json: {status: 'SUCCESS', message: 'Specialité chargée', data: specialite}, status: :ok
            end

            def create
                specialite= Specialite.new(specialite_params)

                if(specialite.save)
                    render json: {status: 'SUCCESS', message: 'Specialité enregistré', data: specialite}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Specialité non enregistré', data: specialite.errors}, status: :unprocessable_entity
                end
            end

            def update
                specialite =Specialite.find(params[:id]) 
                if(specialite.update_attributes(specialite_params))
                    render json: {status: 'SUCCESS', message: 'Modification enregistré', data: specialite}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Modification non enregistré', data: specialite.errors}, status: :unprocessable_entity
                end
            end

            def destroy         
                specialite =Specialite.find(params[:id])   
                specialite.destroy
                render json: {status: 'SUCCESS', message: 'Specialité supprimé', data: specialite}, status: :ok
            end  


            
            private

            def specialite_params
                params.permit(:nomSpecialite)
            end
        end
    end
end
