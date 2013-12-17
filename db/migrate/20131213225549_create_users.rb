class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.text :cc_username
    	t.text :cc_email
    	t.text :cc_first_name 
    	t.text :cc_last_name
    	t.string :cc_birthday
    	t.string :cc_zip_code
      t.text :provider
      t.text :sc_uid, :limit => 8 #usually the same as id == uid
      t.text :sc_id
      t.text :sc_nickname
      t.text :sc_image
      t.text :sc_token
      t.boolean :sc_expires
      t.text :sc_kind
      t.text :sc_permalink
      t.text :sc_username
      t.text :sc_uri
      t.text :sc_permalink_url
      t.text :sc_avatar_url
      t.boolean :sc_online
      t.integer :sc_track_count
      t.integer :sc_playlist_count
      t.text :sc_plan 
      t.integer :sc_public_favorites_count
      t.integer :sc_followers_count
      t.integer :sc_followings_count
      t.integer :sc_upload_seconds_left
      t.boolean  :sc_unlimited_upload_quota
      t.integer :sc_upload_seconds_used
      t.integer :sc_private_tracks_count
      t.integer :sc_private_playlists_count
      t.boolean :sc_primary_email_confirmed
      t.text    :google_uid
      t.text    :google_fullname 
      t.text    :google_first_name  
      t.text    :google_last_name
      t.text    :google_image  
      t.text    :google_link               
      t.text    :google_plus_profile
      t.text    :google_id
      t.text    :google_email
      t.boolean    :google_verified_email 
      t.text :google_token
      t.integer :google_expires_at
      t.boolean :google_expires 
      t.text    :google_refresh_token
      t.text    :google_fullname 
      t.text    :google_given_name 
      t.text    :google_family_name 
      t.text    :google_picture 
      t.text    :google_gender 
      t.text    :google_locale
      t.timestamps
    end
  end
end
