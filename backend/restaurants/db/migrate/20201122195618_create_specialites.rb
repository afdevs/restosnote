class CreateSpecialites < ActiveRecord::Migration[6.0]
  def change
    create_table :specialites do |t|
      t.string :nomSpecialite

      t.timestamps
    end
  end
end
