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

ActiveRecord::Schema.define(version: 2021_05_22_031440) do

  create_table "settings_graphics", force: :cascade do |t|
    t.boolean "private_values_mode"
    t.integer "type_graphic"
    t.integer "time_course"
    t.string "type_class"
    t.integer "owner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_settings_graphics_on_owner_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.string "activation_code"
    t.string "state", default: "P"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users_shareds", force: :cascade do |t|
    t.integer "owner_id"
    t.integer "shared_id"
    t.string "state", default: "P"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_users_shareds_on_owner_id"
  end

  add_foreign_key "settings_graphics", "users", column: "owner_id"
  add_foreign_key "users_shareds", "users", column: "owner_id"
end
