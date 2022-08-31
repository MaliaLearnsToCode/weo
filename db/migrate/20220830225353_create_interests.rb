class CreateInterests < ActiveRecord::Migration[7.0]
  def change
    create_table :interests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :interest_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
