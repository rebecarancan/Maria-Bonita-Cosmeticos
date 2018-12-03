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

ActiveRecord::Schema.define(version: 2018_11_26_185432) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "banks", force: :cascade do |t|
    t.date "day"
    t.string "description"
    t.integer "value_cents"
    t.bigint "master_bank_id"
    t.bigint "income_type_id"
    t.bigint "expense_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expense_type_id"], name: "index_banks_on_expense_type_id"
    t.index ["income_type_id"], name: "index_banks_on_income_type_id"
    t.index ["master_bank_id"], name: "index_banks_on_master_bank_id"
  end

  create_table "expense_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "finances", force: :cascade do |t|
    t.date "day"
    t.string "description"
    t.integer "value_cents"
    t.bigint "income_type_id"
    t.bigint "expense_type_id"
    t.bigint "master_finance_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expense_type_id"], name: "index_finances_on_expense_type_id"
    t.index ["income_type_id"], name: "index_finances_on_income_type_id"
    t.index ["master_finance_id"], name: "index_finances_on_master_finance_id"
  end

  create_table "income_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "master_banks", force: :cascade do |t|
    t.integer "year"
    t.string "month"
    t.integer "balance_cents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "master_finances", force: :cascade do |t|
    t.string "month"
    t.integer "year"
    t.integer "balance_cents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "done", default: false
    t.integer "total_cents"
  end

  create_table "master_notes", force: :cascade do |t|
    t.integer "year"
    t.string "month"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "master_orders", force: :cascade do |t|
    t.integer "year"
    t.string "month"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "master_sales", force: :cascade do |t|
    t.integer "year"
    t.string "month"
    t.integer "balance_cents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.date "day"
    t.string "name"
    t.integer "value_cents"
    t.bigint "master_note_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["master_note_id"], name: "index_notes_on_master_note_id"
  end

  create_table "orders", force: :cascade do |t|
    t.date "purchase"
    t.string "distributor"
    t.date "expire"
    t.integer "value_cents"
    t.string "payment"
    t.bigint "master_order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["master_order_id"], name: "index_orders_on_master_order_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "code"
    t.string "name"
    t.integer "cost_cents"
    t.integer "margin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales", force: :cascade do |t|
    t.date "day"
    t.integer "value_cents"
    t.bigint "income_type_id"
    t.bigint "master_sale_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["income_type_id"], name: "index_sales_on_income_type_id"
    t.index ["master_sale_id"], name: "index_sales_on_master_sale_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "banks", "expense_types"
  add_foreign_key "banks", "income_types"
  add_foreign_key "banks", "master_banks"
  add_foreign_key "finances", "expense_types"
  add_foreign_key "finances", "income_types"
  add_foreign_key "finances", "master_finances"
  add_foreign_key "notes", "master_notes"
  add_foreign_key "orders", "master_orders"
  add_foreign_key "sales", "income_types"
  add_foreign_key "sales", "master_sales"
end
