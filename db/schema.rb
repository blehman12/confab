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

ActiveRecord::Schema.define(version: 20141003204420) do

  create_table "communications", force: true do |t|
    t.string   "excomm"
    t.string   "userinfo"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "communications", ["user_id", "created_at"], name: "index_communications_on_user_id_and_created_at"

  create_table "events", force: true do |t|
    t.string   "name"
    t.date     "start"
    t.date     "stop"
    t.string   "location"
    t.string   "address"
    t.string   "recurrence"
    t.string   "user"
    t.integer  "user_id"
    t.string   "contact"
    t.string   "theme"
    t.string   "category"
    t.string   "subcategoryA"
    t.string   "subcategoryB"
    t.string   "subcategoryC"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tags"
  end

  add_index "events", ["user_id", "created_at"], name: "index_events_on_user_id_and_created_at"

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "skills", force: true do |t|
    t.integer  "user_id"
    t.string   "skill"
    t.integer  "level"
    t.string   "tag"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "skills", ["user_id", "created_at"], name: "index_skills_on_user_id_and_created_at"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
    t.integer  "show_email",      default: 0
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "wants", force: true do |t|
    t.integer  "user_id"
    t.string   "wanted"
    t.string   "tag"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "priority"
  end

  add_index "wants", ["user_id", "created_at"], name: "index_wants_on_user_id_and_created_at"

end
