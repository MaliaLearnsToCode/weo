class CreateParticipantReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :participant_reviews do |t|
      t.string :comment
      t.integer :rating
      t.references :participation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
