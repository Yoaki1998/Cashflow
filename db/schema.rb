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

ActiveRecord::Schema[7.0].define(version: 2023_03_11_155831) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "moves", force: :cascade do |t|
    t.string "name", null: false
    t.string "version", null: false
    t.float "amount", null: false
    t.datetime "date", default: "2023-03-17 12:14:51"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_moves_on_user_id"
  end

  create_table "projets", force: :cascade do |t|
    t.string "name"
    t.integer "priority"
    t.float "amount"
    t.float "load", default: 0.0
    t.float "month_left", default: 0.0
    t.boolean "complete", default: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_projets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.float "p_expense", default: 0.0
    t.float "liquidity", default: 0.0
    t.string "gdata", default: [], array: true
    t.float "cashflow", default: 0.0
    t.float "epargne", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "moves", "users"
  add_foreign_key "projets", "users"
end
