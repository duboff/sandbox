class AddAnnualPropertyTaxCentsAndAnnualInsuranceCentsToResidences < ActiveRecord::Migration
  def change
    add_column :residences, :annual_property_tax_cents, :integer, limit: 8
    add_column :residences, :annual_insurance_cents, :integer, limit: 8
  end
end
