class AuthenticationsController < ApplicationController


	def index
		if current_user 
			@authentications = current_user.authentications
		end 
	end

	def create
		auth = request.env["omniauth.auth"]
		current_user.authentications.create( provider: auth['provider'] , uid: auth['uid'] )
		user = User.create_with_omniauth(auth)
		flash[:notice] = "Authentication successful."
		redirect_to authentications_path
	end


  #TODO look to creating a depandancy for the deleting the user info as well, or moving auth info into this model instead of the user
  def destroy  
  	@authentication = current_user.authentications.find(params[:id])
  	@authentication.destroy
  	flash[:notice] = "Successfully destroyed authentication."
  	redirect_to authentications_path
  end

end
