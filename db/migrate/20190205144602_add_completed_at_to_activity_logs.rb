class AddCompletedAtToActivityLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :activity_logs, :completed_at, :timestamptz
  end
end
