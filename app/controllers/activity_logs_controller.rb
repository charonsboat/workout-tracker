class ActivityLogsController < ApplicationController
  def index
    render json: ActivityLog.all
  end

  def create
    render json: ActivityLog.create(create_params)
  end

  private

  def create_params
    params.permit(:activity_id, :weight, :reps, :time)
  end
end
