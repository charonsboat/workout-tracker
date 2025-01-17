# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_02_05_233219) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "activity_logs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "activity_id", null: false
    t.string "weight"
    t.string "reps"
    t.string "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "completed_at"
    t.text "notes"
    t.index ["activity_id"], name: "index_activity_logs_on_activity_id"
    t.index ["user_id"], name: "index_activity_logs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "activity_logs", "activities"
  add_foreign_key "activity_logs", "users"
end
