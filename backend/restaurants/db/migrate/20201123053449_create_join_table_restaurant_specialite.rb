class CreateJoinTableRestaurantSpecialite < ActiveRecord::Migration[6.0]
  def change
    create_join_table :restaurants, :specialites do |t|
      # t.index [:restaurant_id, :specialite_id]
      # t.index [:specialite_id, :restaurant_id]
    end
  end
end
