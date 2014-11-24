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

ActiveRecord::Schema.define(version: 20141121064659) do

  create_table "documents", force: true do |t|
    t.string   "document_name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "group_docs", id: false, force: true do |t|
    t.integer  "group_id"
    t.integer  "document_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "group_docs", ["group_id", "document_id"], name: "index_group_docs_on_group_id_and_document_id"

  create_table "groups", force: true do |t|
    t.string   "group_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_groups", id: false, force: true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_groups", ["user_id", "group_id"], name: "index_user_groups_on_user_id_and_group_id"

  create_table "users", force: true do |t|
    t.string   "pennkey"
    t.string   "email"
    t.string   "school"
    t.integer  "privilege",     default: 0
    t.string   "password_hash"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
