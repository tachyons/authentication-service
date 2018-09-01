class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:create]

  def create
    user = User.new(user_params)
    if user.save
      render json: UserSerializer.new(user)
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def me
    render json: UserSerializer.new(@current_user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
