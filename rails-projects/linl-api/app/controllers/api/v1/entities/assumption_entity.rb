module API
  module V1
    module Entities
      class AssumptionEntity < Grape::Entity
        expose :id, :user_id, :name, :item_type, :current_percentage, 
          :future_percentage, :monthly_cents, :start_date, :end_date,
          :created_at, :updated_at
      end
    end
  end
end
