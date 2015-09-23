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

ActiveRecord::Schema.define(version: 20150916095508) do

  create_table "announcement_plan_addressees", force: :cascade do |t|
    t.integer  "announcement_id", limit: 4
    t.integer  "user_id",         limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "announcement_plan_addressees", ["announcement_id"], name: "index_announcement_plan_addressees_on_announcement_id", using: :btree
  add_index "announcement_plan_addressees", ["user_id"], name: "index_announcement_plan_addressees_on_user_id", using: :btree

  create_table "announcement_plan_announcements", force: :cascade do |t|
    t.string   "title",               limit: 255
    t.text     "tekst",               limit: 65535
    t.datetime "start_announcing_at"
    t.datetime "stop_announcing_at"
    t.integer  "category_id",         limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "announcement_plan_announcements", ["category_id"], name: "index_announcement_plan_announcements_on_category_id", using: :btree
  add_index "announcement_plan_announcements", ["start_announcing_at"], name: "index_announcement_plan_announcements_on_start_announcing_at", using: :btree
  add_index "announcement_plan_announcements", ["stop_announcing_at"], name: "index_announcement_plan_announcements_on_stop_announcing_at", using: :btree
  add_index "announcement_plan_announcements", ["title"], name: "index_announcement_plan_announcements_on_title", using: :btree

  create_table "announcement_plan_categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "announcement_plan_categories", ["name"], name: "index_announcement_plan_categories_on_name", using: :btree

  create_table "announcement_plan_recipients", force: :cascade do |t|
    t.integer  "announcement_id", limit: 4
    t.integer  "user_id",         limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "announcement_plan_recipients", ["announcement_id"], name: "index_announcement_plan_recipients_on_announcement_id", using: :btree
  add_index "announcement_plan_recipients", ["user_id"], name: "index_announcement_plan_recipients_on_user_id", using: :btree

  create_table "announcement_plan_roles", force: :cascade do |t|
    t.integer  "announcement_id", limit: 4
    t.string   "name",            limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "announcement_plan_roles", ["announcement_id"], name: "index_announcement_plan_roles_on_announcement_id", using: :btree
  add_index "announcement_plan_roles", ["name"], name: "index_announcement_plan_roles_on_name", using: :btree

  create_table "announcement_plan_tenants", force: :cascade do |t|
    t.integer  "announcement_id", limit: 4
    t.integer  "tenant_id",       limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "announcement_plan_tenants", ["announcement_id"], name: "index_announcement_plan_tenants_on_announcement_id", using: :btree
  add_index "announcement_plan_tenants", ["tenant_id"], name: "index_announcement_plan_tenants_on_tenant_id", using: :btree

  create_table "cars", force: :cascade do |t|
    t.string   "color",      limit: 255
    t.integer  "year",       limit: 4
    t.string   "brand",      limit: 255
    t.string   "model",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "naam",       limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tenants", force: :cascade do |t|
    t.string   "administration", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "tenant_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
