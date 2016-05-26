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

ActiveRecord::Schema.define(version: 20160526125047) do

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
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

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
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "artist_events", force: :cascade do |t|
    t.integer  "artist_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_artist_events_on_artist_id", using: :btree
    t.index ["event_id"], name: "index_artist_events_on_event_id", using: :btree
  end

  create_table "artist_members", force: :cascade do |t|
    t.integer  "artist_id"
    t.integer  "member_id"
    t.string   "role"
    t.boolean  "active",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["artist_id"], name: "index_artist_members_on_artist_id", using: :btree
    t.index ["member_id"], name: "index_artist_members_on_member_id", using: :btree
  end

  create_table "artist_releases", force: :cascade do |t|
    t.integer  "artist_id"
    t.integer  "release_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_artist_releases_on_artist_id", using: :btree
    t.index ["release_id"], name: "index_artist_releases_on_release_id", using: :btree
  end

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

  create_table "artists_releases", id: false, force: :cascade do |t|
    t.integer "artist_id"
    t.integer "release_id"
    t.index ["artist_id"], name: "index_artists_releases_on_artist_id", using: :btree
    t.index ["release_id"], name: "index_artists_releases_on_release_id", using: :btree
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
    t.index ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.integer  "venue_id"
    t.integer  "songkick_id"
    t.string   "type"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "songkick_url"
    t.string   "facebook_url"
    t.string   "lastfm_url"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["venue_id"], name: "index_events_on_venue_id", using: :btree
  end

  create_table "external_links", force: :cascade do |t|
    t.integer  "artist_id"
    t.string   "url"
    t.string   "url_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_external_links_on_artist_id", using: :btree
  end

  create_table "members", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "release_reviews", force: :cascade do |t|
    t.integer  "release_id"
    t.string   "title"
    t.string   "url"
    t.text     "quote"
    t.integer  "rating"
    t.integer  "max_rating"
    t.string   "language"
    t.boolean  "visible",    default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["release_id"], name: "index_release_reviews_on_release_id", using: :btree
  end

  create_table "release_type_main_buy_links", force: :cascade do |t|
    t.integer  "release_type_id"
    t.string   "buy_url"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["release_type_id"], name: "index_release_type_main_buy_links_on_release_type_id", using: :btree
  end

  create_table "release_type_other_buy_links", force: :cascade do |t|
    t.integer  "release_type_id"
    t.string   "title"
    t.string   "buy_url"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["release_type_id"], name: "index_release_type_other_buy_links_on_release_type_id", using: :btree
  end

  create_table "release_types", force: :cascade do |t|
    t.integer  "release_id"
    t.string   "format"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["release_id"], name: "index_release_types_on_release_id", using: :btree
  end

  create_table "releases", force: :cascade do |t|
    t.string   "title"
    t.string   "catalog_number"
    t.date     "release_date"
    t.text     "description"
    t.text     "tracklist"
    t.string   "for_fans_of"
    t.string   "bandcamp_url"
    t.text     "bandcamp_player"
    t.boolean  "internal_release", default: true
    t.boolean  "active",           default: true
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "venues", force: :cascade do |t|
    t.integer  "songkick_id"
    t.string   "name"
    t.string   "songkick_url"
    t.string   "city"
    t.string   "country_code"
    t.string   "lng"
    t.string   "lat"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_foreign_key "artist_members", "artists"
  add_foreign_key "artist_members", "members"
  add_foreign_key "events", "venues"
  add_foreign_key "external_links", "artists"
  add_foreign_key "release_reviews", "releases"
  add_foreign_key "release_type_main_buy_links", "release_types"
  add_foreign_key "release_type_other_buy_links", "release_types"
  add_foreign_key "release_types", "releases"
end
