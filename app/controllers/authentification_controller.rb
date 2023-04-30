# frozen_string_literal: true

class AuthentificationController < ActionController::API
  before_action :set_user
  # POST /auth/login
  def sign_in
    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.zone.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime('%m-%d-%Y %H:%M'),
                     username: @user.username }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private

  def set_user
    @user = User.find_by(email: params[:email])
  end

  def login_params
    params.permit(:email, :password)
  end
end
