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
            present :partner, [@user.partner], with: API::V1::Entities::PartnerEntity
          end
          if @user.children
            present :children, @user.children, with: API::V1::Entities::ChildEntity
          end
          if @user.residences
            present :residences, @user.residences, with: API::V1::Entities::ResidenceEntity
          end
          if @user.assets
            present :assets, @user.assets, with: API::V1::Entities::AssetEntity
          end
          if @user.assumptions
            present :assumptions, @user.assumptions, with: API::V1::Entities::AssumptionEntity
          end
          if @user.retirements
            present :retirements, @user.retirements, with: API::V1::Entities::RetirementEntity
          end
        end

        desc "Create new user"
        params do
          #requires :email, type: String, desc: 'Email of the user'
          #requires :password, type: String, desc: 'Password of the user'
          #requires :password_confirmation, type: String, desc: 'Password Confirmation of the user'
        end
        post "" do
          puts 'booger'
          emai = params[:user][:email]
          pass = params[:user][:password]
          pass_conf = params[:user][:password_confirmation]
          User.create({email: emai, password: pass, password_confirmation: pass_conf})
        end
      end
    end
  end
end
