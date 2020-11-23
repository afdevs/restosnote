module Api
    module V1
        class RestaurantsController < ApplicationController
            def index        
                restaurants =Restaurant.joins(:restaurant_specialites, :specialites).select("restaurants.*, specialites.id as specialiteId, specialites.nomSpecialite").order('restaurants.created_at DESC')   

                render json: {status: 'SUCCESS', message: 'Restaurants chargés', data: restaurants}, status: :ok
            end      
            
            def show
                restaurant =Restaurant.joins(:restaurant_specialites, :specialites).select("restaurants.*, specialites.id as specialiteId, specialites.nomSpecialite").find(params[:id])

                render json: {status: 'SUCCESS', message: 'Restaurant chargé', data: restaurant}, status: :ok
            end

            def create
                restaurant= Restaurant.new(restaurant_params)
                
                if(restaurant.save)
                    render json: {status: 'SUCCESS', message: 'Restaurant enregistré', data: restaurant}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Restaurant non enregistré', data: restaurant.errors}, status: :unprocessable_entity
                end
            end

            def update
                restaurant =Restaurant.find(params[:id]) 
                if(restaurant.update_attributes(restaurant_params))
                    render json: {status: 'SUCCESS', message: 'Modification enregistré', data: restaurant}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Modification non enregistré', data: restaurant.errors}, status: :unprocessable_entity
                end
            end

            def destroy         
                restaurant =Restaurant.find(params[:id])   
                restaurant.destroy
                render json: {status: 'SUCCESS', message: 'Restaurant supprimé', data: restaurant}, status: :ok
            end  


            
            private

            def restaurant_params
                params.permit(:nomRestaurant, :forchettePrix, :adresse, :photo)
            end
        end
    end
end