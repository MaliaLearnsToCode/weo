class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.text :detail
      t.string :location
      t.integer :max_participants
      t.boolean :completed
      t.date :start_date
      t.date :end_date
      t.time :start_time
      t.time :end_time
      t.references :itinerary, null: false, foreign_key: true
      t.references :interest_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
