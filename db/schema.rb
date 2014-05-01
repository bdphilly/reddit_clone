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

ActiveRecord::Schema.define(version: 20140501212833) do

  create_table "link_memberships", force: true do |t|
    t.integer  "link_id"
    t.integer  "sub_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "link_memberships", ["link_id", "sub_id"], name: "index_link_memberships_on_link_id_and_sub_id", unique: true

  create_table "links", force: true do |t|
    t.string   "title",        null: false
    t.string   "url",          null: false
    t.string   "text"
    t.integer  "submitter_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "links", ["submitter_id"], name: "index_links_on_submitter_id"
  add_index "links", ["title"], name: "index_links_on_title"
  add_index "links", ["url"], name: "index_links_on_url"

  create_table "subs", force: true do |t|
    t.string   "name",         null: false
    t.integer  "moderator_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subs", ["name"], name: "index_subs_on_name", unique: true

  create_table "users", force: true do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token"
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
