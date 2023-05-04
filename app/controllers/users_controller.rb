class UsersController < ApplicationController
  before_action :authorize_user

    def index
        @users = User.all
        render json: @users
    end

    def show 
        render json: user
    end

    def update 
        user.update!(user_params)
        render json: @user, status: :ok
    end

    def destroy 
        user.destroy
        render json: {}, status: :no_content
    end

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

    def user 
        @user ||= User.find(params[:id])
    end

    def authorize_user 
        authorize(User) 
    end

end
