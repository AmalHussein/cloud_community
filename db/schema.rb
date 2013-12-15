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

ActiveRecord::Schema.define(version: 20131213225549) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: true do |t|
    t.text     "cc_username"
    t.text     "cc_email"
    t.text     "cc_first_name"
    t.text     "cc_last_name"
    t.string   "cc_birthday"
    t.string   "cc_zip_code"
    t.text     "provider"
    t.integer  "sc_uid"
    t.integer  "sc_id"
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
    t.integer  "google_uid"
    t.text     "google_fullname"
    t.text     "google_first_name"
    t.text     "google_last_name"
    t.text     "google_image"
    t.text     "google_plus_profile"
    t.integer  "google_id"
    t.text     "google_email"
    t.boolean  "google_verified_email"
    t.text     "google_given_name"
    t.text     "google_family_name"
    t.text     "google_picture"
    t.text     "google_gender"
    t.text     "google_locale"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
