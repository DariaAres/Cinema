class RegistrationController < ActionController::API
  
    # POST /users
    def sign_up 
      binding.pry
      @user = User.new(user_params)
      if @user.save
        render json: @user, status: :created
      else
        render json: { errors: @user.errors.full_messages },
               status: :unprocessable_entity
      end
    end
  
    def user_params
      params.require(:user).permit(
        :first_name, :last_name, :email, :password, :password_confirmation, :country_id
      )
    end
end
