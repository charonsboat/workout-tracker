class UsersController < ApplicationController
  def create
    render json: User.create(create_params)
  end

  private

  def create_params
    params.permit(:email, :password)
  end
end
