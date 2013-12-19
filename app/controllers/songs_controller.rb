class SongsController < ApplicationController

	def index 
		@songs = Song.all
	end 

	def show 
	  @song = Song.find(params[:id])
	  client = Soundcloud.new(:client_id => ENV['SOUNDCLOUD_CLIENT_ID'])
		embed_info = client.get('/oembed', :url => "http://soundcloud.com/#{@song.username}/#{@song.permalink}")
		@iframe_content = embed_info['html'] 
		@iframe_content.sub!('iframe ', "iframe id='song-#{@song.id}' ")
	end 

end 