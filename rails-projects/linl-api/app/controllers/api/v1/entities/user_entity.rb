module API
  module V1
    module Entities
      class UserEntity < Grape::Entity
        expose :id, :first_name, :last_name, :email,
          :birthdate, :marital_status, :state, :ss_currently_collecting, :ss_monthly_benefits_cents,
          :current_earnings_cents, :final_year_earnings_cents, :created_at, :updated_at
        expose (:partner) { |entity| entity.partner ? [entity.partner.id] : []}
        expose (:children) { |entity| entity.children ? entity.children.pluck(:id) : []}
        expose (:residences) { |entity| entity.residences ? entity.residences.pluck(:id) : [] }
      end
    end
  end
end
