class SessionsController < ApplicationController
  skip_before_action :authenticate_user

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      auth_token = JsonWebToken.encode(user_id: user.id, name: user.name, email: user.email)
      render json: { auth_token: auth_token }, status: :ok
    else
      render json: { error: 'Invalid username / password' }, status: :unauthorized
    end
  end
end
