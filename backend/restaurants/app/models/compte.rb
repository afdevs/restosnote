class Compte < ApplicationRecord
    has_many :commentaires
    has_one :note

    belongs_to :utilisateur

    validates :utilisateur_id, presence:true
    validates :mdp, presence:true
end
