class CreateCommentaires < ActiveRecord::Migration[6.0]
  def change
    create_table :commentaires do |t|
      t.string :avis
      t.references :restaurant, null: false, foreign_key: true
      t.references :compte, null: false, foreign_key: true

      t.timestamps
    end
  end
end
