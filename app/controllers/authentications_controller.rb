class AuthenticationsController < ApplicationController
  

  def index
  	@authentications = Authentication.all 
  end

  def create
  	 auth = request.env["omniauth.auth"]
  	 binding.pry
	   user = User.from_omniauth(auth)
  end
end
