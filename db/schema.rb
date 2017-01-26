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

  create_table "cryptocurrencies", force: :cascade do |t|
    t.string  "name",   limit: 128,                 null: false
    t.boolean "status", limit: 1,   default: false, null: false
  end

  create_table "exchange_rates", force: :cascade do |t|
    t.integer  "cryptocurrency_id", limit: 1,                          default: 0,   null: false
    t.decimal  "exchange_rate",               precision: 12, scale: 2, default: 0.0
    t.datetime "date"
  end

  add_index "exchange_rates", ["cryptocurrency_id"], name: "exchange_rates_cryptocurrencies_id_fk", using: :btree

  create_table "input_addresses", force: :cascade do |t|
    t.string  "address",           limit: 128,                 null: false
    t.integer "cryptocurrency_id", limit: 1,   default: 0,     null: false
    t.boolean "status",            limit: 1,   default: false
  end

  add_index "input_addresses", ["cryptocurrency_id"], name: "input_addresses_cryptocurrencies_id_fk", using: :btree

  create_table "transaction_requests", force: :cascade do |t|
    t.integer  "input_address_id",                 limit: 4,   default: 0, null: false
    t.string   "output_address",                   limit: 128,             null: false
    t.integer  "output_address_cryptocurrency_id", limit: 1,   default: 0, null: false
    t.datetime "date"
  end

  add_index "transaction_requests", ["input_address_id"], name: "transaction_requests_input_addresses_id_fk", using: :btree
  add_index "transaction_requests", ["output_address_cryptocurrency_id"], name: "transaction_requests_cryptocurrencies_id_fk", using: :btree

  create_table "transactions", force: :cascade do |t|
    t.integer  "transaction_request_id", limit: 4
    t.decimal  "input_amount",                       precision: 32, scale: 18, default: 0.0,   null: false
    t.string   "input_txid",             limit: 128,                                           null: false
    t.decimal  "output_amount",                      precision: 32, scale: 18, default: 0.0,   null: false
    t.string   "output_txid",            limit: 128,                                           null: false
    t.datetime "date"
    t.boolean  "status",                 limit: 1,                             default: false, null: false
  end

  add_index "transactions", ["transaction_request_id"], name: "transactions_transaction_requests_id_fk", using: :btree

  add_foreign_key "exchange_rates", "cryptocurrencies", name: "exchange_rates_cryptocurrencies_id_fk"
  add_foreign_key "input_addresses", "cryptocurrencies", name: "input_addresses_cryptocurrencies_id_fk"
  add_foreign_key "transaction_requests", "cryptocurrencies", column: "output_address_cryptocurrency_id", name: "transaction_requests_cryptocurrencies_id_fk"
  add_foreign_key "transaction_requests", "input_addresses", name: "transaction_requests_input_addresses_id_fk"
  add_foreign_key "transactions", "transaction_requests", name: "transactions_transaction_requests_id_fk"
end
