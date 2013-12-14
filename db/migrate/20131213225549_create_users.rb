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
      t.integer :sc_uid  #usually the same as id == uid
      t.integer :sc_id
      t.text :sc_kind
      t.text :sc_permalink
      t.text :sc_username
      t.text :sc_uri
      t.text :sc_permalink_url
      t.text :sc_avatar_url
      t.text :sc_online
      t.integer :sc_track_count
      t.integer :sc_playlist_count
      t.text :sc_plan 
      t.integer :sc_public_favorites_count
      t.integer :sc_followers_count
      t.integer :sc_followings_count
      t.integer :sc_upload_seconds_left
      t.text :sc_quota
      t.integer :sc_private_tracks_count
      t.integer :sc_private_playlists_count
      t.text :sc_primary_email_confirmed
      t.timestamps
    end
  end
end
