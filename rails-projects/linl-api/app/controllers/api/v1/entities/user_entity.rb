module API
  module V1
    module Entities
      class UserEntity < Grape::Entity
        expose :id, :first_name, :last_name, :email, :birthdate, :marital_status,
          :state, :retirement_date, :roth_first, :created_at, :updated_at,
          :current_earnings_cents, :final_year_earnings_cents
        expose (:partner) { |entity| entity.partner ? entity.partner.id : nil}
        expose (:children) { |entity| entity.children ? entity.children.pluck(:id) : nil}
        expose (:residences) { |entity| entity.residences ? entity.residences.pluck(:id) : nil }
        expose (:assets) { |entity| entity.assets ? entity.assets.pluck(:id) : nil }
        expose (:assumptions) { |entity| entity.assumptions ? entity.assumptions.pluck(:id) : nil }
        expose (:retirements) { |entity| entity.retirements ? entity.retirements.pluck(:id) : nil }
      end
    end
  end
end
