OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :soundcloud, ENV['SOUNDCLOUD_CLIENT_ID'], ENV['SOUNDCLOUD_CLIENT_SECRET']
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], 
  {   access_type: "offline",
      scope: "userinfo.email, userinfo.profile, http://gdata.youtube.com",
      prompt: "select_account",
      image_aspect_ratio:  "square",
      image_size:  50
    }
end



