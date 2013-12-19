# == Schema Information
#
# Table name: users
#
#  id                         :integer          not null, primary key
#  cc_username                :text
#  cc_email                   :text
#  cc_first_name              :text
#  cc_last_name               :text
#  cc_birthday                :string(255)
#  cc_zip_code                :string(255)
#  provider                   :text
#  sc_uid                     :text
#  sc_id                      :text
#  sc_nickname                :text
#  sc_image                   :text
#  sc_token                   :text
#  sc_expires                 :boolean
#  sc_kind                    :text
#  sc_permalink               :text
#  sc_username                :text
#  sc_uri                     :text
#  sc_permalink_url           :text
#  sc_avatar_url              :text
#  sc_online                  :boolean
#  sc_track_count             :integer
#  sc_playlist_count          :integer
#  sc_plan                    :text
#  sc_public_favorites_count  :integer
#  sc_followers_count         :integer
#  sc_followings_count        :integer
#  sc_upload_seconds_left     :integer
#  sc_unlimited_upload_quota  :boolean
#  sc_upload_seconds_used     :integer
#  sc_private_tracks_count    :integer
#  sc_private_playlists_count :integer
#  sc_primary_email_confirmed :boolean
#  google_uid                 :text
#  google_fullname            :text
#  google_first_name          :text
#  google_last_name           :text
#  google_image               :text
#  google_link                :text
#  google_plus_profile        :text
#  google_id                  :text
#  google_email               :text
#  google_verified_email      :boolean
#  google_token               :text
#  google_expires_at          :integer
#  google_expires             :boolean
#  google_refresh_token       :text
#  google_given_name          :text
#  google_family_name         :text
#  google_picture             :text
#  google_gender              :text
#  google_locale              :text
#  created_at                 :datetime
#  updated_at                 :datetime
#  email                      :string(255)      default(""), not null
#  encrypted_password         :string(255)      default(""), not null
#  reset_password_token       :string(255)
#  reset_password_sent_at     :datetime
#  remember_created_at        :datetime
#  sign_in_count              :integer          default(0), not null
#  current_sign_in_at         :datetime
#  last_sign_in_at            :datetime
#  current_sign_in_ip         :string(255)
#  last_sign_in_ip            :string(255)
#

class User < ActiveRecord::Base

  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :trackable,
          :validatable

  
  has_many :authentications
  has_many :videos
  has_many :songs
  has_many :instruments

  has_attached_file :avatar, styles: {  medium: "300x300>",
                                        thumb: "100x100>" },
                                        default_url: "/images/:style/missing.png"

  validates :cc_username, presence: true

  def self.login(auth)
    self.create_with_omniauth(auth)
  end

  def self.create_with_omniauth(auth)
  	case auth["provider"]
  	when "soundcloud"
  		@authentication = Authentication.where(uid: auth["uid"].to_s)
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
      user.save_songs
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
      user.google_refresh_token = auth["credentials"]["refresh_token"]
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
      user.save_videos
    end
  end

  def youtube_client 
   YouTubeIt::OAuth2Client.new(
     client_access_token: google_token, client_refresh_token: google_refresh_token,
     client_id: ENV['GOOGLE_CLIENT_ID'], client_secret: ENV['GOOGLE_CLIENT_SECRET'], 
     dev_key: ENV['GOOGLE_DEV_KEY'], expires_at: google_expires_at)
 end 

 def save_videos
  uploads = self.youtube_client.my_videos(:user => google_fullname)
  uploads.videos.each do |upload|
    video = Video.find_or_create_by(unique_id: upload.unique_id) 
    video.unique_id = upload.unique_id 
    video.description = upload.description
    video.author = upload.author.name
    video.thumbnail = upload.thumbnails[0].url
    video.embeddable = upload.embeddable?
    video.published_at = upload.published_at
    video.save_iframe
    self.videos << video
  end 
end 

  def soundclound_client
    SoundCloud.new(client_id:ENV['SOUNDCLOUD_CLIENT_ID'],
      client_secret: ENV['SOUNDCLOUD_CLIENT_SECRET'],
      access_token: sc_token )
  end 

  
def save_songs
  uploads = self.soundclound_client.get("/me/tracks")
  uploads.each do |upload|
    song = Song.find_or_create_by(sc_id: upload.id.to_s)
    song.sc_id = upload.id
    song.song_created_at = upload.created_at
    song.sc_user_id = upload.user_id
    song.duration = upload.duration
    song.sharing = upload.sharing 
    song.embeddable_by = upload.embeddable_by
    song.genre = upload.genre
    song.permalink = upload.permalink
    song.title = upload.title
    song.description = upload.description
    song.uri = upload.uri
    song.username = upload.user.username
    song.save_iframe
    self.songs << song
  end 
end 

end
