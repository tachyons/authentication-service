class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      head :ok
    else
      head :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
