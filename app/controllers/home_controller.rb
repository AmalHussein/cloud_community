class HomeController < ApplicationController

	def index 
	end 

	def login
		redirect_to current_client.authorize_url()
	end

	def callback
		# exchange authorization code for access token
		code = params[:code]
		access_token = current_client.exchange_token(:code => code)
		redirect_to root_url
	end

end
