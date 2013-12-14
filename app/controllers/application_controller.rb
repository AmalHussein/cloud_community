class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # def current_client
  # 	@client ||= SoundCloud.new({
  # 		:client_id     => ENV['CLIENT_ID'],
  # 		:client_secret => ENV['CLIENT_SECRET'],
  # 		:redirect_uri  => ENV['REDIRECT_URI'],
		# })
  # end

  # def current_access_token
  # 	@current_access_token
  # end
end
