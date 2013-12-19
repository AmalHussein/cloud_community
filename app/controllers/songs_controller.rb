class SongsController < ApplicationController

	def index 
		@songs = Song.all
	end 

	def show 
	  @song = Song.find(params[:id])
	  @commentable = @song
  	@comments = @commentable.comments
  	@comment = Comment.new
	end 

end 