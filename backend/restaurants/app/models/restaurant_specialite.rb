class RestaurantSpecialite < ApplicationRecord
  belongs_to :restaurant
  belongs_to :specialite
  
  validates :restaurant_id, presence:true
  validates :specialite_id, presence:true
end
