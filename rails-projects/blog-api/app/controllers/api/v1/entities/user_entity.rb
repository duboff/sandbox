module API
  module V1
    module Entities
      class UserEntity < Grape::Entity
        expose :id, :email, :created_at, :updated_at
        expose (:posts) { |entity| entity.posts.pluck(:id) }
      end
    end
  end
end
