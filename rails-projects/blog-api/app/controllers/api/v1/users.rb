module API
  module V1
    class Users < Grape::API
      include API::V1::Defaults

      resource :users do
        desc "Return all users"
        get "" do
          @users = User.all
          @posts = Post.all
          present :users, @users, with: API::V1::Entities::UserEntity
          present :posts, @posts, with: API::V1::Entities::PostEntity
        end

        desc "Return a user"
        params do
          requires :id, type: Integer, desc: "ID of the user" 
        end
        get ":id" do
          @user = User.where(id: permitted_params[:id]).first!
          @posts = @user.posts
          present :user, @user, with: API::V1::Entities::UserEntity
          present :posts, @posts, with: API::V1::Entities::PostEntity
        end

        desc "Create a new user"
        post "" do
          puts 'creating new user'
          emai = params[:user][:email]
          pass = params[:user][:password]
          pass_conf = params[:user][:password_confirmation]
          User.create({email: emai, password: pass, password_confirmation: pass_conf})
          puts params.inspect
        end
      end

      private
        def user_params
          params.require(:user).permit(:email, :password, :password_confirmation)
        end
    end
  end
end
