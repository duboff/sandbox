module API
  module V1
    class Residences < Grape::API
      include API::V1::Defaults
      helpers SharedParams

      resource :residences do

        desc "Create new residence"
        params do
          use :create_residence
        end
        post "" do
          user = User.find(permitted_params[:residence][:user])
          permitted_params[:residence].delete :user
          puts permitted_params[:residence].inspect
          user.residences.create(permitted_params[:residence])
        end
      end
    end
  end
end
