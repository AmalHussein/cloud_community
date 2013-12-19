# == Schema Information
#
# Table name: songs
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  sc_id           :text
#  song_created_at :datetime
#  sc_user_id      :text
#  duration        :integer
#  sharing         :text
#  embeddable_by   :text
#  genre           :text
#  title           :text
#  description     :text
#  uri             :text
#  username        :text
#  permalink       :text
#  iframe_markup   :text
#  created_at      :datetime
#  updated_at      :datetime
#

class Song < ActiveRecord::Base
  belongs_to :user
 
	def client 
		Soundcloud.new(:client_id => ENV['SOUNDCLOUD_CLIENT_ID'])
	end 

	def save_iframe
	  embed_info = self.client.get('/oembed', :url => "http://soundcloud.com/#{username}/#{permalink}")
	  self.iframe_markup = embed_info['html'] 
	end

end


