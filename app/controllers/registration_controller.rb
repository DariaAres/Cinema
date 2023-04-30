class RegistrationController < ActionController::API
  
    # POST /users
    def sign_up 
      @user = User.new(user_params)
      if @user.save
        render json: @user, status: :created
      else
        render json: { errors: @user.errors.full_messages },
               status: :unprocessable_entity
      end
    end
  
    def user_params
      params.permit(
        :first_name, :last_name, :email, :password
      )
    end
end
