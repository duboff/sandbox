require 'ap'

module API
  module V1
    class Users < Grape::API
      include API::V1::Defaults
      helpers SharedParams

      #TODO refactor
      desc "Handles user subModel udpates"
      namespace 'users/:user_id' do
        resource :residences do
          get "" do
            residences = User.find(params[:user_id]).residences
            present :residences, residences, with: API::V1::Entities::ResidenceEntity
          end

          get ":resource_id" do
            residence = User.find(params[:user_id]).residences.find(params[:resource_id])
            present :residence, residence, with: API::V1::Entities::ResidenceEntity
          end
        end
      end

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
          use :user
        end
        put ':id' do
          #TODO this should be the setup method(as part of the URL)
          nested_models = [:partner, :residences, :children, :assets, :assumptions, :retirements]
          params = permitted_params[:user]
          nested_models.each do |key|
            if !params[key] || params[key].empty?
              params.delete key
            else
              params[(key.to_s + '_attributes').to_sym] = params.delete key
            end
          end

          user = User.find_by_email(params[:email])
          user.update(params)
        end
      end
    end
  end
end
