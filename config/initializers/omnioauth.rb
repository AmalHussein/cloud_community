OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :soundcloud, ENV['SOUNDCLOUD_CLIENT_KEY'], ENV['SOUNDCLOUD_CLIENT_SECRET']
end