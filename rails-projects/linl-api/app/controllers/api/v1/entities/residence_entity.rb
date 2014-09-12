module API
  module V1
    module Entities
      class ResidenceEntity < Grape::Entity
        expose :id, :user_id, :name, :kind, :monthly_payment_cents, :value_cents, 
          :mortgage_balance_cents, :years_remaining, :misc_annual_expenses_cents,
          :utilities_cents, :created_at, :updated_at
      end
    end
  end
end
