module API
  module V1
    module Entities
      class ResidenceEntity < Grape::Entity
        expose :id, :user_id, :name, :monthly_payment_cents, :current_value_cents, 
          :mortgage_balance_cents, :years_remaining, :misc_annual_expenses_cents,
          :annual_property_tax_cents, :utilities_cents, :annual_insurance_cents,
          :owned, :created_at, :updated_at
      end
    end
  end
end
