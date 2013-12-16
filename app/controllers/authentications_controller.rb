class AuthenticationsController < ApplicationController
  

  def index
  	@authentications = current_user.authentications
  end

  def create
  	 auth = request.env["omniauth.auth"]
	   current_user.authentications.create( provider: auth['provider'] , uid: auth['uid'] )
	   user = User.create_with_omniauth(auth)
	   redirect_to root_url
  end
end
