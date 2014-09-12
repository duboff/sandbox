class AddBaseFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :birthdate, :datetime
    add_column :users, :marital_status, :boolean
    add_column :users, :state, :string
    add_column :users, :ss_currently_collecting, :boolean
    add_column :users, :ss_monthly_benefits_cents, :integer, limit: 8
    add_column :users, :current_earnings_cents, :integer, limit: 8
    add_column :users, :final_year_earnings_cents, :integer, limit: 8
  end
end
