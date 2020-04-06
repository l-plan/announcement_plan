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

ActiveRecord::Schema.define(version: 20200403225825) do

  create_table "announcement_plan_announcements", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.text "txt"
    t.datetime "start_announcing_at"
    t.datetime "stop_announcing_at"
    t.integer "category_id"
    t.boolean "concept"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_announcement_plan_announcements_on_category_id"
    t.index ["concept"], name: "index_announcement_plan_announcements_on_concept"
    t.index ["start_announcing_at"], name: "index_announcement_plan_announcements_on_start_announcing_at"
    t.index ["stop_announcing_at"], name: "index_announcement_plan_announcements_on_stop_announcing_at"
    t.index ["title"], name: "index_announcement_plan_announcements_on_title"
    t.index ["user_id"], name: "index_announcement_plan_announcements_on_user_id"
  end

  create_table "announcement_plan_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.text "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_announcement_plan_categories_on_name"
  end

  create_table "announcement_plan_recipients", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "announcement_id"
    t.integer "user_id"
    t.datetime "read"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["announcement_id"], name: "index_announcement_plan_recipients_on_announcement_id"
    t.index ["read"], name: "index_announcement_plan_recipients_on_read"
    t.index ["user_id"], name: "index_announcement_plan_recipients_on_user_id"
  end

  create_table "cars", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.string "color"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
