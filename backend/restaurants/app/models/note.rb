class Note < ApplicationRecord
  belongs_to :restaurant
  belongs_to :compte

  
  validates :adore, numericality: { only_integer: true }
  validates :deteste, numericality: { only_integer: true }
  validates :restaurant_id, presence:true
  validates :compte_id, presence:true
end
