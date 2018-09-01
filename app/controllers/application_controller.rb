class ApplicationController < ActionController::API
  before_action :authenticate_user

  protected

  def authenticate_user
    auth_header = headers['Authorization'].split(' ').last if headers['Authorization'].present?
    raise "Missing auth header" unless auth_header
    token = JsonWebToken.decode(http_auth_header)
    @current_user = User.find(token[:user_id])
  end
end
