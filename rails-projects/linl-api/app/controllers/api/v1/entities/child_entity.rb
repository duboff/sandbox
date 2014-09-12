module API
  module V1
    module Entities
      class ChildEntity < Grape::Entity
        expose :id, :user_id, :name, :birthdate, :expected_tuition_cents, :created_at, :updated_at
      end
    end
  end
end
