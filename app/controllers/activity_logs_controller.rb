class ActivityLogsController < ApplicationController
  def index
    render json: ActivityLog.where(index_params.merge(user: current_user))
  end

  def create
    render json: ActivityLog.create!(
      create_params.tap do |args|
        args[:user] = current_user
        args[:completed_at] = Time.at(args[:completed_at]) if args[:completed_at]
      end
    )
  end

  private

  def index_params
    params.permit(:activity_id)
  end

  def create_params
    params.permit(:activity_id, :weight, :reps, :time, :notes, :completed_at)
  end
end
