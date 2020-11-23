class Commentaire < ApplicationRecord
  belongs_to :restaurant
  belongs_to :compte
  
  validates :restaurant_id, presence:true
  validates :compte_id, presence:true
  validates :avis, presence:true

end
