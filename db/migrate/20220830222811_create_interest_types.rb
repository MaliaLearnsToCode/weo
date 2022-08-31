class CreateInterestTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :interest_types do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
