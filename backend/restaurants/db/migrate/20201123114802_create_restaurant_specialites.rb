class CreateRestaurantSpecialites < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurant_specialites do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.references :specialite, null: false, foreign_key: true

      t.timestamps
    end
  end
end
