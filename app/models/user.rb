class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :cc_username
  has_many :authentications
  #attr_accessible :email, :password, :password_confirmation, :remember_me, :cc_username ADD STRONG PARAMS LATER
  
  #TODO consolidate cc_email and devise email field
  #TODO add strong params for devise for user fields
  #TODO add validates uniquineess of email, and username , also add a regex for the email

  def self.from_omniauth(auth)
  	where(auth.slice("sc_uid")).first  || where(auth.slice("google_uid")).first || create_with_omniauth(auth)
  end

  def self.create_with_omniauth(auth)
  	case auth["provider"]
  	when "soundcloud"
  		@authentication = Authentication.where(uid: auth["uid"].to_s)
  		# binding.pry
  		user = @authentication.last.user 
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
  		user.save! 
  	when "google_oauth2"
  		@authentication = Authentication.where(uid: auth["uid"])
  		user = @authentication.last.user 
  		user.google_uid = auth["uid"]
  		user.google_fullname = auth["info"]["name"]
  		#user.google_email = auth["info"]["email"] #email repeat
  		#user.google_first_name = auth["info"]["first_name"] #same repeat 
  		user.google_last_name = auth["info"]["last_name"]
  		user.google_image = auth["info"]["image"]										#urls is a hash of links
  		user.google_plus_profile = auth["info"]["urls"]["Google"] #look into possibly saving more than url for ppl with more links
  		user.google_token = auth["credentials"]["token"]
  		user.google_expires_at = auth["credentials"]["expires_at"]
  		user.google_expires = auth["credentials"]["expires"]
  		user.google_id = auth["extra"]["raw_info"]["id"]
  		user.google_email = auth["extra"]["raw_info"]["email"]
  		user.google_verified_email = auth["extra"]["raw_info"]["verified_email"]
  		user.google_fullname = auth["extra"]["raw_info"]["fullname"]
  		user.google_given_name = auth["extra"]["raw_info"]["given_name"] #repeat of first name
  		user.google_family_name = auth["extra"]["raw_info"]["family_name"] #repeat of last name
  		user.google_link = auth["extra"]["raw_info"]["link"]
  		user.google_picture = auth["extra"]["raw_info"]["picture"]
  		user.google_gender = auth["extra"]["raw_info"]["gender"]
  		user.google_locale = auth["extra"]["raw_info"]["locale"]
  		user.save!
  	end
  end
end
