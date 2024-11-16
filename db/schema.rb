ActiveRecord::Schema[7.1].define(version: 2024_11_16_095716) do
  create_table "debits", force: :cascade do |t|
    t.integer "amount"
    t.text "description"
    t.integer "employee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_debits_on_employee_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.integer "salary"
    t.integer "allowance"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "debits", "employees"
end
