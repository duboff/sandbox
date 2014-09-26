class AddRetirementDateToPartners < ActiveRecord::Migration
  def change
    add_column :partners, :retirement_date, :datetime
  end
end
