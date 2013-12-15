class User < ActiveRecord::Base

	def self.from_omniauth(auth)
	  where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
	end

	def self.create_from_omniauth(auth)
		case provider
			when auth["provider"] == "soundcloud"
			  create! do |user|
			    user.provider = auth["provider"]
			    user.sc_uid = auth["uid"]
			    user.sc_nickname = auth["info"]["nickname"]
			    user.sc_image = auth["info"]["image"]
			   	user.sc_token = auth["credentials"]["token"]
			    user.sc_expires = auth["credentials"]["expires"]
			    user.sc_expires = auth["credentials"]
			    user.sc_id = auth["extra"]["raw_info"]["id"]
			   	user.sc_kind = auth["extra"]["raw_info"]["kind"]
			   	user.sc_permalink = auth["extra"]["raw_info"]["permalink"]
			   	user.sc_username = auth["extra"]["raw_info"]["username"]
			   	user.sc_uri = auth["extra"]["raw_info"]["uri"]
			   	user.sc_permalink_url = auth["extra"]["raw_info"]["permalink_url"]
			   	user.sc_avatar_url = auth["extra"]["raw_info"]["avatar_url"]
			   	user.sc_online = auth["extra"]["raw_info"]["online"]
			   	user.sc_track_count = auth["extra"]["raw_info"]["track_count"]
			   	user.sc_playlist_count = auth["extra"]["raw_info"]["playlist_count"]
			   	user.sc_plan = auth["extra"]["raw_info"]["plan"]
			   	user.sc_public_favorites_count = auth["extra"]["raw_info"]["public_favorites_count"]
			   	user.sc_followers_count = auth["extra"]["raw_info"]["followers_count"]
			   	user.sc_followings_count = auth["extra"]["raw_info"]["followings_count"]
			   	user.sc_upload_seconds_left = auth["extra"]["raw_info"]["upload_seconds_left"]
			   	user.sc_unlimited_upload_quota = auth["extra"]["raw_info"]["quota"]["unlimited_upload_quota"]
			   	user.sc_upload_seconds_used = auth["extra"]["raw_info"]["quota"]["upload_seconds_used"]
			   	user.sc_private_tracks_count = auth["extra"]["raw_info"]["private_tracks_count"]
			   	user.sc_private_playlists_count = auth["extra"]["raw_info"]["private_playlists_count"]
			   	user.sc_primary_email_confirmed = auth["extra"]["raw_info"]["primary_email_confirmed"]
			  end 
			  when auth["provider"] == "google"

	  end
	end

end
