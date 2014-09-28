module API
  module V1
    module Entities
      class AssetEntity < Grape::Entity
        expose :id, :user_id, :name, :item_type, :rate_of_return,
          :start_date, :end_date, :user_owned, :created_at, :updated_at,
          :initial_amount_cents, :final_amount_cents
      end
    end
  end
end
