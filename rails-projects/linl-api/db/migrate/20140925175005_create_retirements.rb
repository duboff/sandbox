class CreateRetirements < ActiveRecord::Migration
  def change
    create_table :retirements do |t|
      t.integer :user_id
      t.string :name
      t.string :item_type
      t.integer :monthly_cents, limit: 8
      t.integer :total_amount_cents, limit: 8
      t.integer :contributions_cents, limit: 8
      t.integer :employer_contributions_cents, limit: 8
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :user_owned

      t.timestamps
    end
  end
end
