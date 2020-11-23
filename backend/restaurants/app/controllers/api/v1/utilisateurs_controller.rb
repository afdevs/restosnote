module Api
    module V1
        class UtilisateursController < ApplicationController
            def index         
                utilisateurs =Utilisateur.order('created_at DESC')      

                render json: {status: 'SUCCESS', message: 'Utilisateurs chargés', data: utilisateurs}, status: :ok
            end            

            def show         
                utilisateur =Utilisateur.find(params[:id])   

                render json: {status: 'SUCCESS', message: 'Utilisateur chargé', data: utilisateur}, status: :ok
            end    
            
            def create
                utilisateur= Utilisateur.new(utilisateur_params)

                if(utilisateur.save)
                    render json: {status: 'SUCCESS', message: 'Utilisateur enregistré', data: utilisateur}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Utilisateur non enregistré', data: utilisateur.errors}, status: :unprocessable_entity
                end
            end

            def update
                utilisateur =Utilisateur.find(params[:id]) 
                if(utilisateur.update_attributes(utilisateur_params))
                    render json: {status: 'SUCCESS', message: 'Modification enregistré', data: utilisateur}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Modification non enregistré', data: utilisateur.errors}, status: :unprocessable_entity
                end
            end

            def destroy         
                utilisateur =Utilisateur.find(params[:id])   
                utilisateur.destroy
                render json: {status: 'SUCCESS', message: 'Utilisateur supprimé', data: utilisateur}, status: :ok
            end    

            
            private

            def utilisateur_params
                params.permit(:nom, :prenom, :email, :telephone)
            end
        end
    end
end