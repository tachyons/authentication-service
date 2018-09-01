class ApplicationController < ActionController::API
  before_action :authenticate_user

  protected

  def authenticate_user
    auth_header = request.headers['Authorization'].split(' ').last if request.headers['Authorization'].present?
    raise 'Missing auth header' unless auth_header
    token = JsonWebToken.decode(auth_header)[0]
    @current_user = User.find(token['user_id'])
  end
end
