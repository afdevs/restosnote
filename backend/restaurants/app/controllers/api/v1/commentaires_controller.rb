module Api
    module V1
        class CommentairesController < ApplicationController
            def index      
                commentaires =Commentaire.joins(:restaurant, :compte).order('commentaires.created_at DESC')   
                
                # restaurants =Commentaire.joins(:restaurant, :compte).select("restaurants.*").order('restaurants.created_at DESC')   
                
                # comptes =Commentaire.joins(:restaurant, :compte).select("comptes.*").order('comptes.created_at DESC')   
                
                render json: {status: 'SUCCESS', message: 'Commentaires chargés', data: commentaires}, status: :ok
                #["commentaires": commentaires, "restaurants": restaurants, "comptes": comptes]
            end    
            
            def show         
                commentaire =Commentaire.joins(:restaurant, :compte).find(params[:id])                   
                
                render json: {status: 'SUCCESS', message: 'Commentaire chargé', data: commentaire}, status: :ok
            end    

            def create
                commentaire= Commentaire.new(commentaire_params)

                if(commentaire.save)
                    render json: {status: 'SUCCESS', message: 'Commentaire enregistré', data: commentaire}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Commentaire non enregistré', data: commentaire.errors}, status: :unprocessable_entity
                end
            end

            def update
                commentaire =Commentaire.find(params[:id]) 
                if(commentaire.update_attributes(commentaire_params))
                    render json: {status: 'SUCCESS', message: 'Modification enregistré', data: commentaire}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Modification non enregistré', data: commentaire.errors}, status: :unprocessable_entity
                end
            end

            def destroy         
                commentaire =Commentaire.find(params[:id])   
                commentaire.destroy
                render json: {status: 'SUCCESS', message: 'Commentaire supprimé', data: commentaire}, status: :ok
            end  


            
            private

            def commentaire_params
                params.permit(:restaurant_id, :compte_id, :avis)
            end
        end
    end
end