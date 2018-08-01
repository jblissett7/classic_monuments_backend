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

ActiveRecord::Schema.define(version: 2018_08_01_161906) do

  create_table "monuments", force: :cascade do |t|
    t.integer "order_id"
    t.string "monument_type"
    t.string "single_or_double"
    t.string "length"
    t.string "width"
    t.string "height"
    t.string "color"
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "USD", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_monuments_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "status"
    t.date "date_order_created"
    t.date "date_approval_sent"
    t.date "date_order_approved"
    t.date "date_order_cut"
    t.date "date_monument_ordered"
    t.date "date_set"
    t.string "ordered_by"
    t.string "address"
    t.string "phone_number"
    t.string "email"
    t.integer "total_fees_cents", default: 0, null: false
    t.string "total_fees_currency", default: "USD", null: false
    t.integer "balance_due_cents", default: 0, null: false
    t.string "balance_due_currency", default: "USD", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
