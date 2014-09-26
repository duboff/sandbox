module API
  module V1
    module Entities
      class PartnerEntity < Grape::Entity
        expose :id, :user_id, :name, :birthdate, :state, :ss_currently_collecting,
          :current_earnings_cents, :final_year_earnings_cents, :retirement_age, :roth_first,
          :created_at, :updated_at
      end
    end
  end
end
