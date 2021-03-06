# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151013051230) do

  create_table "options", force: :cascade do |t|
    t.decimal  "strike_price"
    t.string   "contract_name"
    t.decimal  "last"
    t.decimal  "bid"
    t.decimal  "ask"
    t.decimal  "change"
    t.decimal  "percent_change"
    t.integer  "volume"
    t.integer  "open_interest"
    t.decimal  "implied_volatility"
    t.integer  "option_type",             default: 0
    t.integer  "expiration_time_seconds", default: 0
    t.integer  "stock_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "options", ["stock_id"], name: "index_options_on_stock_id"

  create_table "stocks", force: :cascade do |t|
    t.string   "name"
    t.string   "ticker"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
