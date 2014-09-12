class CreateResidences < ActiveRecord::Migration
  def change
    create_table :residences do |t|
      t.integer :user_id
      t.string :name
      t.string :kind
      t.integer :monthly_payment_cents
      t.integer :value_cents, limit: 8
      t.integer :mortgage_balance_cents, limit: 8
      t.integer :years_remaining
      t.integer :misc_annual_expenses_cents, limit: 8
      t.integer :utilities_cents

      t.timestamps
    end
    add_index :residences, :user_id
  end
end
