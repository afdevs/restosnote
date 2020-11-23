class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :nomRestaurant
      t.integer :forchettePrix
      t.string :adresse
      t.string :photo

      t.timestamps
    end
  end
end
