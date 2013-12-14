client = SoundCloud.new({
  :client_id     => ENV['CLIENT_ID'],
  :client_secret => ENV['CLIENT_SECRET'],
  :redirect_uri  => ENV['REDIRECT_URI'],
})

# redirect_to client.authorize_url()