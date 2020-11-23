module Api
    module V1
        class ComptesController < ApplicationController
            def index         
                comptes =Compte.joins(:utilisateur).select("comptes.*, utilisateurs.email").order('comptes.created_at DESC')   
                
                render json: {status: 'SUCCESS', message: 'Comptes chargés', data: comptes}, status: :ok
            end       
            
            def show         
                compte =Compte.joins(:utilisateur).select("comptes.*, utilisateurs.email").find(params[:id])   
                
                render json: {status: 'SUCCESS', message: 'Compte chargé', data: compte}, status: :ok
            end    
            
            def create
                compte= Compte.new(compte_params)

                if(compte.save)
                    render json: {status: 'SUCCESS', message: 'Compte enregistré', data: compte}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Compte non enregistré', data: compte.errors}, status: :unprocessable_entity
                end
            end

            def update
                compte =Compte.find(params[:id]) 
                if(compte.update_attributes(compte_params))
                    render json: {status: 'SUCCESS', message: 'Modification enregistré', data: compte}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Modification non enregistré', data: compte.errors}, status: :unprocessable_entity
                end
            end

            def destroy         
                compte =Compte.find(params[:id])   
                compte.destroy
                render json: {status: 'SUCCESS', message: 'Compte supprimé', data: compte}, status: :ok
            end  


            
            private

            def compte_params
                params.permit(:utilisateur_id, :mdp)
            end
        end
    end
end