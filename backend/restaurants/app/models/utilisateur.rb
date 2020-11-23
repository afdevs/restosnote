class Utilisateur < ApplicationRecord
    has_one :compte 

    validates :nom, presence:true
    validates :prenom, presence:true
    validates :email, presence:true
    validates :telephone, presence:true
end
