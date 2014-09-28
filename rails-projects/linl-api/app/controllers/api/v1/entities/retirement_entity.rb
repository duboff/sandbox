module API
  module V1
    module Entities
      class RetirementEntity < Grape::Entity
        expose :id, :user_id, :name, :item_type, :start_date, :end_date, :created_at, :updated_at,
          :monthly_cents, :total_amount_cents, :contributions_cents, :employer_contributions_cents
      end
    end
  end
end
