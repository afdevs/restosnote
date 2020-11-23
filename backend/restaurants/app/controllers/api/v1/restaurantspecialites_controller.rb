module Api
    module V1
        class RestaurantspecialitesController < ApplicationController
            def index
                restaurantSpecialites = RestaurantSpecialite.order('created_at DESC')   
                
                render json: {status: 'SUCCESS', message: 'Restau et spec  chargés', data: restaurantSpecialites}, status: :ok
            end

            def create            
                restaurantSpec= RestaurantSpecialite.new(restaurantSpecialite_params)
                
                if(restaurantSpec.save)
                    render json: {status: 'SUCCESS', message: 'Restau et spec enregistré', data: restaurantSpec}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Restau et spec non enregistré', data: restaurantSpec.errors}, status: :unprocessable_entity
                end
            end


            private

            def restaurantSpecialite_params
                params.permit(:restaurant_id, :specialite_id)
            end
        end
    end
end
