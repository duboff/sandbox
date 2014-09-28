module API
  module V1
    module Entities
      class ResidenceEntity < Grape::Entity
        expose :id, :user_id, :name, :years_remaining, :utilities_cents, :owned, :created_at, :updated_at,
          :monthly_payment_cents, :current_value_cents, :mortgage_balance_cents, :misc_annual_expenses_cents,
          :annual_property_tax_cents, :annual_insurance_cents
      end
    end
  end
end
