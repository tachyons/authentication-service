class ApplicationController < ActionController::API
  before_action :authenticate_user

  protected

  attr_reader :current_user

  def authenticate_user
    @current_user = FetchUserFromToken.new(request.headers['Authorization']).call
  rescue FetchUserFromToken::InvalidToken
    render json: { message: 'Authentication Token is invalid' }, status: :unauthorised
  rescue FetchUserFromToken::MissingAuthHeader
    render json: { message: 'Authentication header is missing' }, status: :unauthorised
  end
end
