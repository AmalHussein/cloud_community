class SessionsController < ApplicationController

	def create
	  auth = request.env["omniauth.auth"]
	  user = User.find_by_provider_and_sc_uid(auth["provider"], auth["uid"]) ||
	  			 User.find_by_provider_and_google_uid(auth["provider"], auth["uid"]) ||
	  			 User.create_from_omniauth(auth)
	 #  if auth["provider"] == "google_oauth2"
	 #  session[:user_id] = user.google_uid
		# end 
		# binding.pry
		#session[:user_id] = user.id
	  redirect_to root_url, :notice => "Signed in!"
	end

	#Note: Should these both be the same for both logouts? Youtube and SoundCloud?
	def destroy
	  session[:user_id] = nil
	  redirect_to root_url, :notice => "Signed out!"
	end
end


