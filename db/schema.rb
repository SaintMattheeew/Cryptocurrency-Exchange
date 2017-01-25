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

ActiveRecord::Schema.define(version: 0) do

  create_table "input_addresses", force: :cascade do |t|
    t.string  "address",           limit: 128, null: false
    t.integer "cryptocurrency_id", limit: 1,   null: false
    t.integer "status",            limit: 1,   null: false
  end

  create_table "transaction_requests", force: :cascade do |t|
    t.integer  "input_address_id",                 limit: 4,   null: false
    t.string   "output_address",                   limit: 128, null: false
    t.integer  "output_address_cryptocurrency_id", limit: 1,   null: false
    t.datetime "date",                                         null: false
  end

  add_index "transaction_requests", ["input_address_id"], name: "input_address_id", using: :btree

  add_foreign_key "transaction_requests", "input_addresses", name: "transaction_requests_ibfk_1"
end
