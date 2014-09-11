module API
  module V1
    module Entities
      class PostEntity < Grape::Entity
        expose :id, :title, :body, :created_at, :updated_at
      end
    end
  end
end
