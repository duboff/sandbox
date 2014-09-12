module API
  module V1
    class Users < Grape::API
      include API::V1::Defaults

      resource :users do
        desc "Return a user"
        params do
          requires :id, type: String, desc: "ID of the user"
        end
        get ":id", root: "user" do
          @user = User.where(id: permitted_params[:id]).first!
          present :user, @user, with: API::V1::Entities::UserEntity
          if @user.partner 
            present :partner, @user.partner, with: API::V1::Entities::PartnerEntity
          end
          if @user.children
            present :children, @user.children, with: API::V1::Entities::ChildEntity
          end
          if @user.residences
            present :residences, @user.residences, with: API::V1::Entities::ResidenceEntity
          end
        end
      end
    end
  end
end
