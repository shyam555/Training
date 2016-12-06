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

ActiveRecord::Schema.define(version: 20161202143907) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "client_id"
    t.string   "add"
    t.string   "mob_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "addresses", ["client_id"], name: "index_addresses_on_client_id"

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "mail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "ord_no"
    t.datetime "ord_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "orders", ["client_id"], name: "index_orders_on_client_id"

  create_table "roles", force: :cascade do |t|
    t.string   "role_one"
    t.string   "role_two"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
