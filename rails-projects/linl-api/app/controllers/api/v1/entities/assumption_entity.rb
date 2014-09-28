module API
  module V1
    module Entities
      class AssumptionEntity < Grape::Entity
        expose :id, :user_id, :name, :item_type, :current_percentage, 
          :future_percentage, :start_date, :end_date, :monthly_cents,
          :created_at, :updated_at
      end
    end
  end
end
