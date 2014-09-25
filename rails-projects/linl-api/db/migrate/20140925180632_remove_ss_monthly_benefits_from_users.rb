class RemoveSsMonthlyBenefitsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :ss_monthly_benefits_cents
  end
end
