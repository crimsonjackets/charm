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

ActiveRecord::Schema.define(version: 20130714222356) do

  create_table "charm_accounts", force: true do |t|
    t.string "type",            default: "User", null: false
    t.string "email",                            null: false
    t.string "password_digest",                  null: false
    t.string "name",                             null: false
  end

  add_index "charm_accounts", ["email"], name: "index_charm_accounts_on_email", unique: true, using: :btree

  create_table "charm_meta_tags", force: true do |t|
    t.string "path",                         null: false
    t.binary "data", default: "\\x04087b00", null: false
  end

  create_table "charm_pages", force: true do |t|
    t.string   "path",                         null: false
    t.boolean  "published",    default: false, null: false
    t.datetime "published_at"
    t.string   "heading",                      null: false
    t.text     "body",                         null: false
  end

  add_index "charm_pages", ["path"], name: "index_charm_pages_on_path", unique: true, using: :btree

  create_table "charm_templates", force: true do |t|
    t.string "path", null: false
    t.string "file", null: false
  end

  add_index "charm_templates", ["path"], name: "index_charm_templates_on_path", unique: true, using: :btree

  create_table "charm_titles", force: true do |t|
    t.string "path",  null: false
    t.string "value", null: false
  end

  add_index "charm_titles", ["path"], name: "index_charm_titles_on_path", unique: true, using: :btree

end
