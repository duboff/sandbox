module API
  module V1
    module Entities
      class ChildEntity < Grape::Entity
        expose :id, :user_id, :name, :birthdate, :expected_tuition_cents, 
          :college_entry_date, :college_exit_date, :created_at, :updated_at
      end
    end
  end
end
