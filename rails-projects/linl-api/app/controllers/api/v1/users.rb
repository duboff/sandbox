module API
  module V1
    class Users < Grape::API
      include API::V1::Defaults

      resource :users do
        helpers do
          def user_params
            ActionController::Parameters.new(params).require(:user).permit(
              :id, :email, :password, :password_confirmation, :first_name, :last_name,
              :birthdate, :state, :ss_currently_collecting, :current_earnings_cents,
              :final_year_earnings_cents, :roth_first, :retirement_date,
              :marital_status, :created_at, :updated_at)
          end

        end
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
        post "" do
          User.create(user_params)
        end

        desc "Update user attributes"
        params do
          requires :user, type: Hash do
            requires :email, type: String
            optional :first_name, :last_name,
                :birthdate, :state, :ss_currently_collecting, :current_earnings_cents,
                :final_year_earnings_cents, :roth_first, :retirement_date,
                :marital_status, :created_at, :updated_at
          end
        end
        put ':id' do
          User.find_by_email(params[:user][:email]).update(permitted_params[:user])
        end
      end

    end
  end
end
