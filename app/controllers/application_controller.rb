class ApplicationController < ActionController::Base
  # temporarily disable CSRF validation
  skip_before_action :verify_authenticity_token
  before_action :authenticate_by_token

  private

  def current_user
    @current_user ||= User.new
  end

  def authenticate_by_creds
    user = User.find_by!(email: creds_params[:email]).authenticate(creds_params[:password])

    return head :unauthorized unless user

    @current_user = user
  rescue ActiveRecord::RecordNotFound => _e
    head :unauthorized
  end

  def authenticate_by_token
    token = JwtService.decode(request.headers['Authorization'].split(' ').last)

    @current_user = User.find(token[:payload][:id])
  rescue JWT::ExpiredSignature, JWT::DecodeError, JWT::VerificationError => _e
    head :unauthorized
  end

  def creds_params
    params.permit(:email, :password)
  end
end
