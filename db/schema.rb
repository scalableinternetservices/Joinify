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

ActiveRecord::Schema.define(version: 20161024002423) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attending", id: false, force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "user_id",  null: false
    t.index ["event_id", "user_id"], name: "index_attending_on_event_id_and_user_id", using: :btree
    t.index ["user_id", "event_id"], name: "index_attending_on_user_id_and_event_id", using: :btree
  end

  create_table "clique_has_user", id: false, force: :cascade do |t|
    t.integer "clique_id", null: false
    t.integer "user_id",   null: false
    t.index ["clique_id", "user_id"], name: "index_clique_has_user_on_clique_id_and_user_id", using: :btree
    t.index ["user_id", "clique_id"], name: "index_clique_has_user_on_user_id_and_clique_id", using: :btree
  end

  create_table "cliques", force: :cascade do |t|
    t.string   "name"
    t.integer  "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "message"
    t.integer  "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "event_id"
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "start_date"
    t.string   "description"
    t.boolean  "is_public"
    t.string   "media_path"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "owner_id",             null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "comments", "events"
  add_foreign_key "comments", "users", column: "creator_id"
  add_foreign_key "events", "users", column: "owner_id"
end
