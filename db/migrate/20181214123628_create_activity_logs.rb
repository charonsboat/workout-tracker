class CreateActivityLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :activity_logs do |t|
      t.references :user, foreign_key: true, null: false
      t.references :activity, foreign_key: true, null: false
      t.string :weight
      t.string :reps
      t.string :time
      t.timestamps null: false
    end
  end
end
