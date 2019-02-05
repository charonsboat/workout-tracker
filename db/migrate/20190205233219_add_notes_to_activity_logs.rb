class AddNotesToActivityLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :activity_logs, :notes, :text
  end
end
