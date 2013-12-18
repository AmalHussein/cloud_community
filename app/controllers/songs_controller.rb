class SongsController < ApplicationController

	def index 
		client = Soundcloud.new(:client_id => ENV['SOUNDCLOUD_CLIENT_ID'])
		embed_info = client.get('/oembed', :url => "http://soundcloud.com/#{@song.username}/#{song.title}")
		@iframe_content = embed_info['html'] 
		@song = Song.find_by_title(title: song.title)
		@iframe_content.sub!('iframe ', "iframe id='song-#{@song.id}' ")
	end 

	def show 
		@song = Song.find(params[:id])
		#binding.pry
		client = Soundcloud.new(:client_id => ENV['SOUNDCLOUD_CLIENT_ID'])
		track_url = "http://soundcloud.com/#{song.username}/#{song.permalink}"
		embed_info = client.get('/oembed', :url => track_url)
		@iframe_content = embed_info['html'] 
		@iframe_content.sub!('iframe ', "iframe id='song-#{@song.id}' ")
	end 

end 