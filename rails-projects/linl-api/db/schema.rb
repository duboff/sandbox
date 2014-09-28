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

ActiveRecord::Schema.define(version: 20140928215030) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "assets", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "item_type"
    t.integer  "rate_of_return"
    t.integer  "initial_amount_cents", limit: 8
    t.integer  "final_amount_cents",   limit: 8
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "user_owned"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assumptions", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "item_type"
    t.integer  "current_percentage"
    t.integer  "future_percentage"
    t.integer  "monthly_cents",      limit: 8
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "user_owned"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "children", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "birthdate"
    t.integer  "expected_tuition_cents", limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "college_entry_date"
    t.datetime "college_exit_date"
  end

  add_index "children", ["user_id"], name: "index_children_on_user_id", using: :btree

  create_table "partners", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "birthdate"
    t.string   "state"
    t.boolean  "ss_currently_collecting"
    t.integer  "current_earnings_cents",    limit: 8
    t.integer  "final_year_earnings_cents", limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "roth_first"
    t.datetime "retirement_date"
  end

  add_index "partners", ["user_id"], name: "index_partners_on_user_id", using: :btree

  create_table "residences", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.integer  "monthly_payment_cents"
    t.integer  "current_value_cents",        limit: 8
    t.integer  "mortgage_balance_cents",     limit: 8
    t.integer  "years_remaining"
    t.integer  "misc_annual_expenses_cents", limit: 8
    t.integer  "utilities_cents"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "annual_property_tax_cents",  limit: 8
    t.integer  "annual_insurance_cents",     limit: 8
    t.boolean  "owned"
  end

  add_index "residences", ["user_id"], name: "index_residences_on_user_id", using: :btree

  create_table "retirements", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "item_type"
    t.integer  "monthly_cents",                limit: 8
    t.integer  "total_amount_cents",           limit: 8
    t.integer  "contributions_cents",          limit: 8
    t.integer  "employer_contributions_cents", limit: 8
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "user_owned"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "encrypted_password",                  default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "authentication_token"
    t.datetime "birthdate"
    t.string   "state"
    t.boolean  "ss_currently_collecting"
    t.integer  "current_earnings_cents",    limit: 8
    t.integer  "final_year_earnings_cents", limit: 8
    t.boolean  "roth_first"
    t.datetime "retirement_date"
    t.boolean  "marital_status"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
