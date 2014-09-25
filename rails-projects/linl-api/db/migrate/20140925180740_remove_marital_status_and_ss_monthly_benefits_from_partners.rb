class RemoveMaritalStatusAndSsMonthlyBenefitsFromPartners < ActiveRecord::Migration
  def change
    remove_column :users, :marital_status
  end
end
