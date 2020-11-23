class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.integer :adore
      t.integer :deteste
      t.references :restaurant, null: false, foreign_key: true
      t.references :compte, null: false, foreign_key: true

      t.timestamps
    end
  end
end
