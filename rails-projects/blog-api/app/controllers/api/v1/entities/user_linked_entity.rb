module API
  module V1
    module Entities
      class UserLinkedEntity < Grape::Entity
        expose :posts, using: API::V1::Entities::PostEntity
      end
    end
  end
end
