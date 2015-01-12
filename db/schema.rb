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

ActiveRecord::Schema.define(version: 20141112153816) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "crews", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: true do |t|
    t.integer  "number"
    t.string   "description"
    t.string   "customer"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "payroll_state"
    t.boolean  "certified_payroll"
    t.integer  "wage_template"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",            default: true
    t.integer  "account_id"
  end

  create_table "phases", force: true do |t|
    t.string   "number"
    t.string   "description"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "job_id"
  end

  create_table "timecards", force: true do |t|
    t.datetime "pay_period_end_date"
    t.datetime "date"
    t.integer  "user_id"
    t.integer  "job_id"
    t.integer  "phase_id"
    t.integer  "equipment_id"
    t.string   "tax_state"
    t.string   "unemployment_state"
    t.string   "insurance_state"
    t.integer  "insurance_code"
    t.integer  "crew_id"
    t.boolean  "certified_payroll"
    t.integer  "craft_id"
    t.integer  "craft_class_id"
    t.integer  "earnings_type_id"
    t.decimal  "hours"
    t.decimal  "wage"
    t.decimal  "amount",              precision: 15, scale: 2
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "approved",                                     default: false
  end

  add_index "timecards", ["user_id", "created_at"], name: "index_timecards_on_user_id_and_created_at", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
    t.integer  "crew_id"
    t.boolean  "super_user"
    t.integer  "account_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
