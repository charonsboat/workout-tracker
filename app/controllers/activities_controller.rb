class ActivitiesController < ApplicationController
  def index
    render json: Activity.all
  end

  def create
    render json: Activity.create!(create_params)
  end

  private

  def create_params
    params.permit(:name)
  end
end
