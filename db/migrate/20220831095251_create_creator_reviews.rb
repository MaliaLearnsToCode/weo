class CreateCreatorReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :creator_reviews do |t|
      t.string :comment
      t.integer :rating
      t.references :participant, null: false, foreign_key: true
      t.references :creator, null: false, foreign_key: true

      t.timestamps
    end
  end
end
