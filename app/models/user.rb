class User < ActiveRecord::Base

	def self.from_omniauth(auth)
	  where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
	end

	def self.create_from_omniauth(auth)
	  create! do |user|
	    user.provider = auth["provider"]
	    user.sc_uid = auth["uid"]
	    user.sc_nickname = auth["info"]["nickname"]
	    user.sc_image = auth["info"]["image"]
	   	user.sc_token = auth["credentials"]["token"]
	    user.sc_expires = auth["credentials"]["expires"]
	    user.sc_expires = auth["credentials"]
	    user.sc_id = auth["raw_info"]["id"]
	   	user.sc_ = auth["raw_info"][""]
	   	user.sc_ = auth["raw_info"][""]
	   	user.sc_ = auth["raw_info"][""]
	   	user.sc_ = auth["raw_info"][""]
	   	user.sc_ = auth["raw_info"][""]
	   	user.sc_ = auth["raw_info"][""]
	   	user.sc_ = auth["raw_info"][""]
	   	user.sc_ = auth["raw_info"][""]
	   	user.sc_ = auth["raw_info"][""]
	   	user.sc_ = auth["raw_info"][""]
	   	user.sc_ = auth["raw_info"][""]
	   	user.sc_ = auth["raw_info"][""]
	   	user.sc_ = auth["raw_info"][""]
	   	user.sc_ = auth["raw_info"][""]
	   	user.sc_ = auth["raw_info"][""]
	   	user.sc_ = auth["raw_info"][""]
	   	user.sc_ = auth["raw_info"][""]
	   	user.sc_ = auth["raw_info"][""]




	  end
	end

end
