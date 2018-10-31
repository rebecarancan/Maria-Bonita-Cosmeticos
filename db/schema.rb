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

ActiveRecord::Schema.define(version: 2018_10_23_200344) do

  create_table "banks", force: :cascade do |t|
    t.date "day"
    t.integer "value_cents"
    t.integer "income_type_id"
    t.integer "record_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["income_type_id"], name: "index_banks_on_income_type_id"
    t.index ["record_type_id"], name: "index_banks_on_record_type_id"
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
    t.integer "expense_type_id"
    t.integer "record_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expense_type_id"], name: "index_finances_on_expense_type_id"
    t.index ["record_type_id"], name: "index_finances_on_record_type_id"
  end

  create_table "income_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.date "day"
    t.string "name"
    t.integer "value_cents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer "code"
    t.string "name"
    t.integer "cost_cents"
    t.integer "margin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "record_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales", force: :cascade do |t|
    t.date "day"
    t.integer "value_cents"
    t.integer "income_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["income_type_id"], name: "index_sales_on_income_type_id"
  end

end
