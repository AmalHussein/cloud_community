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

ActiveRecord::Schema.define(version: 20131219123048) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: true do |t|
    t.integer  "user_id"
    t.text     "provider"
    t.text     "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authentications", ["user_id"], name: "index_authentications_on_user_id", using: :btree

  create_table "instruments", force: true do |t|
    t.text     "name"
    t.text     "image_icon"
    t.text     "hover_icon"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "songs", force: true do |t|
    t.integer  "user_id"
    t.text     "sc_id"
    t.datetime "song_created_at"
    t.text     "sc_user_id"
    t.integer  "duration"
    t.text     "sharing"
    t.text     "embeddable_by"
    t.text     "genre"
    t.text     "title"
    t.text     "description"
    t.text     "uri"
    t.text     "username"
    t.text     "permalink"
    t.text     "iframe_markup"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "songs", ["user_id"], name: "index_songs_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.text     "cc_username"
    t.text     "cc_email"
    t.text     "cc_first_name"
    t.text     "cc_last_name"
    t.string   "cc_birthday"
    t.string   "cc_zip_code"
    t.text     "provider"
    t.text     "sc_uid"
    t.text     "sc_id"
    t.text     "sc_nickname"
    t.text     "sc_image"
    t.text     "sc_token"
    t.boolean  "sc_expires"
    t.text     "sc_kind"
    t.text     "sc_permalink"
    t.text     "sc_username"
    t.text     "sc_uri"
    t.text     "sc_permalink_url"
    t.text     "sc_avatar_url"
    t.boolean  "sc_online"
    t.integer  "sc_track_count"
    t.integer  "sc_playlist_count"
    t.text     "sc_plan"
    t.integer  "sc_public_favorites_count"
    t.integer  "sc_followers_count"
    t.integer  "sc_followings_count"
    t.integer  "sc_upload_seconds_left"
    t.boolean  "sc_unlimited_upload_quota"
    t.integer  "sc_upload_seconds_used"
    t.integer  "sc_private_tracks_count"
    t.integer  "sc_private_playlists_count"
    t.boolean  "sc_primary_email_confirmed"
    t.text     "google_uid"
    t.text     "google_fullname"
    t.text     "google_first_name"
    t.text     "google_last_name"
    t.text     "google_image"
    t.text     "google_link"
    t.text     "google_plus_profile"
    t.text     "google_id"
    t.text     "google_email"
    t.boolean  "google_verified_email"
    t.text     "google_token"
    t.integer  "google_expires_at"
    t.boolean  "google_expires"
    t.text     "google_refresh_token"
    t.text     "google_given_name"
    t.text     "google_family_name"
    t.text     "google_picture"
    t.text     "google_gender"
    t.text     "google_locale"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                      default: "", null: false
    t.string   "encrypted_password",         default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",              default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_intruments", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "instrument_id"
  end

  add_index "users_intruments", ["instrument_id"], name: "index_users_intruments_on_instrument_id", using: :btree
  add_index "users_intruments", ["user_id", "instrument_id"], name: "index_users_intruments_on_user_id_and_instrument_id", using: :btree
  add_index "users_intruments", ["user_id"], name: "index_users_intruments_on_user_id", using: :btree

  create_table "videos", force: true do |t|
    t.integer  "user_id"
    t.text     "unique_id"
    t.text     "description"
    t.text     "author"
    t.text     "thumbnail"
    t.boolean  "embeddable"
    t.integer  "duration"
    t.text     "title"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
