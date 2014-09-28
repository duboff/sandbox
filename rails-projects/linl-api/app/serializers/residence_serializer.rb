class ResidenceSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :name, :monthly_payment_cents, :current_value_cents, 
    :mortgage_balance_cents, :years_remaining, :misc_annual_expenses_cents,
    :utilities_cents, :annual_property_tax_cents, :annual_insurance_cents,
    :created_at, :updated_at
end
