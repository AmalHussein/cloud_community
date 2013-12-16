class SessionsController < ApplicationController

	def create
		session[:user_id] = user.id
	  redirect_to root_url, :notice => "Signed in!"
	end

	#Note: Should these both be the same for both logouts? Youtube and SoundCloud?
	def destroy
	  session[:user_id] = nil
	  redirect_to root_url, :notice => "Signed out!"
	end
end


