class ActivityLogsController < ApplicationController
  def index
    render json: ActivityLog.all
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

  def create_params
    params.permit(:activity_id, :weight, :reps, :time, :notes, :completed_at)
  end
end
