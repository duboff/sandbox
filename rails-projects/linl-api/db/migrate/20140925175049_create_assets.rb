class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.integer :user_id
      t.string :name
      t.string :item_type
      t.integer :rate_of_return
      t.integer :initial_amount_cents, limit: 8
      t.integer :final_amount_cents, limit: 8
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :user_owned

      t.timestamps
    end
  end
end
