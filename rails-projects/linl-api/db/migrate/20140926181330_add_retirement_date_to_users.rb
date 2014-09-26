class AddRetirementDateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :retirement_date, :datetime
  end
end
