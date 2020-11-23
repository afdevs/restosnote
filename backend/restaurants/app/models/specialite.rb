class Specialite < ApplicationRecord

    #has_and_belongs_to_many :restaurants
    has_many :restaurant_specialites
    has_many :restaurants, :through => :restaurant_specialites

    validates :nomSpecialite, presence:true

end
