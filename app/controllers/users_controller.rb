class UsersController < ApplicationController
  skip_before_action :authenticate_by_token, only: [:sign_in]
  before_action :authenticate_by_creds, only: [:sign_in]

  def create
    render json: User.create!(create_params)
  rescue ActiveRecord::RecordInvalid => _e
    head :conflict
  end

  def current
    render json: current_user
  end

  def sign_in
    render json: { user: current_user, token: JwtService.encode(id: current_user.id) }
  end

  private

  def create_params
    params.permit(:email, :password)
  end
end
