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

ActiveRecord::Schema[7.1].define(version: 2024_11_27_173034) do
  create_table "debits", force: :cascade do |t|
    t.integer "amount"
    t.text "description"
    t.integer "main_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["main_id"], name: "index_debits_on_main_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.integer "salary"
    t.integer "allowance"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mains", force: :cascade do |t|
    t.integer "month"
    t.integer "year"
    t.string "name"
    t.integer "salary"
    t.integer "allowance"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "opayments", force: :cascade do |t|
    t.integer "payment_method", default: 0
    t.text "description"
    t.integer "main_id", null: false
    t.decimal "amount", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["main_id"], name: "index_opayments_on_main_id"
  end

  create_table "overtimes", force: :cascade do |t|
    t.integer "hours_value"
    t.date "time"
    t.integer "main_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal "payment", precision: 10, scale: 2, default: "0.0"
    t.index ["main_id"], name: "index_overtimes_on_main_id"
  end

  add_foreign_key "debits", "mains"
  add_foreign_key "opayments", "mains"
  add_foreign_key "overtimes", "mains"
end
