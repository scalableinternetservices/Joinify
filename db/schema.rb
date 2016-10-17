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

ActiveRecord::Schema.define(version: 20161017231238) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attending", id: false, force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "user_id",  null: false
    t.index ["event_id", "user_id"], name: "index_attending_on_event_id_and_user_id", using: :btree
    t.index ["user_id", "event_id"], name: "index_attending_on_user_id_and_event_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "start_date"
    t.string   "description"
    t.boolean  "is_public"
    t.string   "media_path"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "owner_id",    null: false
  end

  create_table "invited", id: false, force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "user_id",  null: false
    t.index ["event_id", "user_id"], name: "index_invited_on_event_id_and_user_id", using: :btree
    t.index ["user_id", "event_id"], name: "index_invited_on_user_id_and_event_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.integer  "age"
    t.string   "sex"
    t.text     "bio"
    t.string   "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "events", "users", column: "owner_id"
end
