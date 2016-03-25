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

ActiveRecord::Schema.define(version: 20160324160241) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "artist_members", force: :cascade do |t|
    t.integer  "artist_id"
    t.integer  "member_id"
    t.string   "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "artist_members", ["artist_id"], name: "index_artist_members_on_artist_id", using: :btree
  add_index "artist_members", ["member_id"], name: "index_artist_members_on_member_id", using: :btree

  create_table "artist_releases", force: :cascade do |t|
    t.integer  "artist_id"
    t.integer  "release_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "artist_releases", ["artist_id"], name: "index_artist_releases_on_artist_id", using: :btree
  add_index "artist_releases", ["release_id"], name: "index_artist_releases_on_release_id", using: :btree

  create_table "artists", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "origin"
    t.string   "genre"
    t.string   "formed"
    t.string   "disbanded"
    t.integer  "songkick_artist_id"
    t.boolean  "active",             default: true
    t.boolean  "booking",            default: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "external_links", force: :cascade do |t|
    t.integer  "artist_id"
    t.string   "url"
    t.string   "url_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "external_links", ["artist_id"], name: "index_external_links_on_artist_id", using: :btree

  create_table "members", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "release_reviews", force: :cascade do |t|
    t.string   "title"
    t.integer  "release_id"
    t.string   "url"
    t.text     "quote"
    t.boolean  "visible"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "release_reviews", ["release_id"], name: "index_release_reviews_on_release_id", using: :btree

  create_table "releases", force: :cascade do |t|
    t.string   "title"
    t.string   "catalog_number"
    t.date     "release_date"
    t.text     "description"
    t.text     "tracklist"
    t.string   "bandcamp_url"
    t.text     "additional_info"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "artist_members", "artists"
  add_foreign_key "artist_members", "members"
  add_foreign_key "artist_releases", "artists"
  add_foreign_key "artist_releases", "releases"
  add_foreign_key "external_links", "artists"
  add_foreign_key "release_reviews", "releases"
end
