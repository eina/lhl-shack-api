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

ActiveRecord::Schema.define(version: 20200324063325) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pgcrypto"

  create_table "agreements", id: :uuid, default: "gen_random_uuid()", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.jsonb    "form_values"
    t.boolean  "is_complete"
    t.boolean  "is_expired"
    t.integer  "household_id"
    t.text     "html_string"
  end

  add_index "agreements", ["household_id"], name: "index_agreements_on_household_id", using: :btree

  create_table "bills", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "total_amount"
    t.date     "due_date"
    t.string   "name"
    t.string   "interval"
    t.integer  "household_id"
  end

  add_index "bills", ["household_id"], name: "index_bills_on_household_id", using: :btree

  create_table "documents", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "s3_identifier"
    t.integer  "household_id"
  end

  add_index "documents", ["household_id"], name: "index_documents_on_household_id", using: :btree

  create_table "households", force: :cascade do |t|
    t.integer  "user_id"
    t.uuid     "house_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "is_active"
    t.jsonb    "housekeeping"
  end

  add_index "households", ["house_id"], name: "index_households_on_house_id", using: :btree
  add_index "households", ["user_id"], name: "index_households_on_user_id", using: :btree

  create_table "houses", id: :uuid, default: "gen_random_uuid()", force: :cascade do |t|
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "total_rent_amt"
    t.integer  "total_security_deposit_amt"
    t.string   "address"
    t.integer  "number_of_rooms"
    t.integer  "number_of_bathrooms"
    t.boolean  "pet_friendly"
    t.boolean  "smoking_allowed"
    t.integer  "landlord_id",                null: false
  end

  add_index "houses", ["landlord_id"], name: "index_houses_on_landlord_id", using: :btree

  create_table "landlords", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "email"
    t.string   "company"
    t.string   "address"
  end

  create_table "split_bills", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "bill_portion"
    t.integer  "user_id",      null: false
    t.integer  "bill_id",      null: false
  end

  add_index "split_bills", ["bill_id"], name: "index_split_bills_on_bill_id", using: :btree
  add_index "split_bills", ["user_id"], name: "index_split_bills_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "email"
    t.string   "password"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "agreements", "households"
  add_foreign_key "bills", "households"
  add_foreign_key "documents", "households"
  add_foreign_key "households", "houses"
  add_foreign_key "households", "users"
  add_foreign_key "houses", "landlords"
  add_foreign_key "split_bills", "bills"
  add_foreign_key "split_bills", "users"
end
