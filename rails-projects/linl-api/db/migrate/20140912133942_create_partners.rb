class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.integer :user_id
      t.string :name
      t.datetime :birthdate
      t.boolean :marital_status
      t.string :state
      t.boolean :ss_currently_collecting
      t.integer :ss_monthly_benefits_cents, limit: 8
      t.integer :current_earnings_cents, limit: 8
      t.integer :final_year_earnings_cents, limit: 8

      t.timestamps
    end
    add_index :partners, :user_id
  end
end
