class CreateUtilisateurs < ActiveRecord::Migration[6.0]
  def change
    create_table :utilisateurs do |t|
      t.string :nom
      t.string :prenom
      t.string :email
      t.string :telephone

      t.timestamps
    end
  end
end
