class RemoveSsMonthlyBenefitsFromPartners < ActiveRecord::Migration
  def change
    remove_column :partners, :ss_monthly_benefits_cents
  end
end
