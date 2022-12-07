# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_07_015851) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "show_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["show_id"], name: "index_bookings_on_show_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "club_followings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "club_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_club_followings_on_club_id"
    t.index ["user_id"], name: "index_club_followings_on_user_id"
  end

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_clubs_on_user_id"
  end

  create_table "comedian_followings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "comedian_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comedian_id"], name: "index_comedian_followings_on_comedian_id"
    t.index ["user_id"], name: "index_comedian_followings_on_user_id"
  end

  create_table "show_comedians", force: :cascade do |t|
    t.bigint "show_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["show_id"], name: "index_show_comedians_on_show_id"
    t.index ["user_id"], name: "index_show_comedians_on_user_id"
  end

  create_table "shows", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "date"
    t.string "start_time"
    t.string "end_time"
    t.string "address"
    t.string "poster_url"
    t.bigint "club_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_shows_on_club_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "open_id"
    t.string "nickname"
    t.string "role"
    t.string "avatar_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bookings", "shows"
  add_foreign_key "bookings", "users"
  add_foreign_key "club_followings", "clubs"
  add_foreign_key "club_followings", "users"
  add_foreign_key "clubs", "users"
  add_foreign_key "comedian_followings", "users"
  add_foreign_key "comedian_followings", "users", column: "comedian_id"
  add_foreign_key "show_comedians", "shows"
  add_foreign_key "show_comedians", "users"
  add_foreign_key "shows", "clubs"
end
