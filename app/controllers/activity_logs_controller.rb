class ActivityLogsController < ApplicationController
  def new
    @activity_log = ActivityLog.new
    @activities = Activity.all
  end

  def create
    @activity_log = ActivityLog.create(create_params)

    redirect_to action: :new
  end

  private

  def create_params
    params.require(:activity_log).permit(:activity_id, :weight, :reps, :time)
  end
end
