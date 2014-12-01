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

ActiveRecord::Schema.define(version: 20141130180353) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "messages", force: true do |t|
    t.text     "body"
    t.integer  "author_id"
    t.integer  "prev_status_id"
    t.integer  "prev_owner_id"
    t.integer  "ticket_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["author_id"], name: "index_messages_on_author_id", using: :btree
  add_index "messages", ["prev_owner_id"], name: "index_messages_on_prev_owner_id", using: :btree
  add_index "messages", ["prev_status_id"], name: "index_messages_on_prev_status_id", using: :btree
  add_index "messages", ["ticket_id"], name: "index_messages_on_ticket_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses_tickets", id: false, force: true do |t|
    t.integer "status_id", null: false
    t.integer "ticket_id", null: false
  end

  add_index "statuses_tickets", ["status_id", "ticket_id"], name: "index_statuses_tickets_on_status_id_and_ticket_id", using: :btree
  add_index "statuses_tickets", ["ticket_id", "status_id"], name: "index_statuses_tickets_on_ticket_id_and_status_id", using: :btree

  create_table "tickets", force: true do |t|
    t.string   "ref"
    t.string   "creator_name"
    t.string   "creator_email"
    t.string   "department"
    t.string   "subject"
    t.text     "body"
    t.integer  "owner_id"
    t.integer  "status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tickets", ["owner_id"], name: "index_tickets_on_owner_id", using: :btree
  add_index "tickets", ["status_id"], name: "index_tickets_on_status_id", using: :btree

  create_table "user_roles", id: false, force: true do |t|
    t.integer "user_id", null: false
    t.integer "role_id", null: false
  end

  add_index "user_roles", ["role_id", "user_id"], name: "index_user_roles_on_role_id_and_user_id", using: :btree
  add_index "user_roles", ["user_id", "role_id"], name: "index_user_roles_on_user_id_and_role_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "first_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
