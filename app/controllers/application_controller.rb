class ApplicationController < ActionController::Base
  # temporarily disable CSRF validation
  skip_before_action :verify_authenticity_token

  private

  def current_user
    @current_user ||= User.new
  end

  def authenticate_by_creds
    @current_user = User.find_by(email: creds_params[:email]).authenticate(creds_params[:password])
  end

  def creds_params
    params.permit(:email, :password)
  end
end
