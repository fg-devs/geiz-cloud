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

ActiveRecord::Schema.define(version: 20151204151153) do

  create_table "cloud_service_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "cloud_services", force: :cascade do |t|
    t.string   "title",                 limit: 255
    t.string   "short_description",     limit: 255
    t.text     "long_description",      limit: 65535
    t.decimal  "price",                               precision: 10
    t.string   "provider_url",          limit: 255
    t.boolean  "active"
    t.integer  "cloud_service_type_id", limit: 4
    t.integer  "user_id",               limit: 4
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "cloud_services", ["cloud_service_type_id"], name: "index_cloud_services_on_cloud_service_type_id", using: :btree
  add_index "cloud_services", ["user_id"], name: "index_cloud_services_on_user_id", using: :btree

  create_table "cloud_services_paas_categories", id: false, force: :cascade do |t|
    t.integer "cloud_service_id", limit: 4, null: false
    t.integer "paas_category_id", limit: 4, null: false
  end

  create_table "cloud_services_saas_categories", id: false, force: :cascade do |t|
    t.integer "cloud_service_id", limit: 4, null: false
    t.integer "saas_category_id", limit: 4, null: false
  end

  create_table "iaas_attributes", force: :cascade do |t|
    t.decimal  "ram",                           precision: 10
    t.decimal  "cpu",                           precision: 10
    t.decimal  "storage",                       precision: 10
    t.decimal  "bandwidth",                     precision: 10
    t.integer  "cloud_service_id",    limit: 4
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "operating_system_id", limit: 4
  end

  add_index "iaas_attributes", ["cloud_service_id"], name: "index_iaas_attributes_on_cloud_service_id", using: :btree
  add_index "iaas_attributes", ["operating_system_id"], name: "index_iaas_attributes_on_operating_system_id", using: :btree

  create_table "operating_systems", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "paas_categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "saas_categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.boolean  "admin",                              default: false
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.boolean  "active",                             default: true
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "cloud_services", "cloud_service_types"
  add_foreign_key "cloud_services", "users"
  add_foreign_key "iaas_attributes", "cloud_services"
  add_foreign_key "iaas_attributes", "operating_systems"
end
