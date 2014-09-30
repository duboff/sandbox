module API
  module V1
    class Users < Grape::API
      include API::V1::Defaults
      helpers SharedParams

      resource :users do
        desc "Return a user"
        params do
          use :find_user
        end
        get ":id", root: "user" do
          @user = User.where(id: permitted_params[:id]).first!
          present :user, @user, with: API::V1::Entities::UserEntity
          if @user.partner 
            present :partner, [@user.partner], with: API::V1::Entities::PartnerEntity
          end
          if !@user.children.empty?
            present :children, @user.children, with: API::V1::Entities::ChildEntity
          end
          if !@user.residences.empty?
            present :residences, @user.residences, with: API::V1::Entities::ResidenceEntity
          end
          if !@user.assets.empty?
            present :assets, @user.assets, with: API::V1::Entities::AssetEntity
          end
          if !@user.assumptions.empty?
            present :assumptions, @user.assumptions, with: API::V1::Entities::AssumptionEntity
          end
          if !@user.retirements.empty?
            present :retirements, @user.retirements, with: API::V1::Entities::RetirementEntity
          end
        end

        desc "Create new user"
        params do
          use :create_user
        end
        post "" do
          User.create(permitted_params[:user])
        end

        desc "Update user attributes"
        params do
          use :user, :partner
        end
        put ':id' do
          puts 'booger'
          user = User.find_by_email(permitted_params[:user][:email])
          user.update(permitted_params[:user])
        end
      end
    end
  end
end
