class CreateCreatorReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :creator_reviews do |t|
      t.string :comment
      t.integer :rating
      t.references :participant, null: false
      t.references :creator, null: false

      t.timestamps
    end

    add_foreign_key :creator_reviews, :users, column: :participant_id
    add_foreign_key :creator_reviews, :users, column: :creator_id
  end
end
