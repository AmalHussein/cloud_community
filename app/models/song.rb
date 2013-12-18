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
#  created_at      :datetime
#  updated_at      :datetime
#

class Song < ActiveRecord::Base
  belongs_to :user


#attempt to move these methods into the model, and out of controller. 
def self.display
  client = Soundcloud.new(:client_id => ENV['SOUNDCLOUD_CLIENT_ID'])
	embed_info = client.get('/oembed', :url => "http://soundcloud.com/#{@song.username}/#{@song.permalink}")
	@iframe_content = embed_info['html'] 
	@iframe_content.sub!('iframe ', "iframe id='song-#{@song.id}' ")
end



end


