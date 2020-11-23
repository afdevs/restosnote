class CreateComptes < ActiveRecord::Migration[6.0]
  def change
    create_table :comptes do |t|
      t.integer :compte_id
      t.string :mdp

      t.timestamps
    end
  end
end
