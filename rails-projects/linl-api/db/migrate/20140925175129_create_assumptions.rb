class CreateAssumptions < ActiveRecord::Migration
  def change
    create_table :assumptions do |t|
      t.integer :user_id
      t.string :name
      t.string :item_type
      t.integer :current_percentage
      t.integer :future_percentage
      t.integer :monthly_cents, limit: 8
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :user_owned

      t.timestamps
    end
  end
end
