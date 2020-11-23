class Restaurant < ApplicationRecord
    has_many :commentaires
    has_one :note

    #has_and_belongs_to_many :specialites
    has_many :restaurant_specialites
    has_many :specialites, :through=> :restaurant_specialites


    validates :nomRestaurant, presence:true
    validates :forchettePrix, presence:true
    validates :adresse, presence:true
    validates :photo, presence:true
end
