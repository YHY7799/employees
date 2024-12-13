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

ActiveRecord::Schema[7.1].define(version: 2024_12_13_110601) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

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
    t.string "email"
    t.string "phone"
    t.integer "main_id"
    t.integer "user_id", null: false
    t.index ["main_id"], name: "index_employees_on_main_id"
    t.index ["user_id"], name: "index_employees_on_user_id"
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
    t.string "email"
    t.string "phone"
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_mains_on_user_id"
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

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name"
    t.integer "business_type"
    t.string "business_name"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "debits", "mains"
  add_foreign_key "employees", "mains"
  add_foreign_key "employees", "users"
  add_foreign_key "mains", "users"
  add_foreign_key "opayments", "mains"
  add_foreign_key "overtimes", "mains"
end
