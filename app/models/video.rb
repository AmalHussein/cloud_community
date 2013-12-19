# == Schema Information
#
# Table name: videos
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  unique_id    :text
#  description  :text
#  author       :text
#  thumbnail    :text
#  embeddable   :boolean
#  duration     :integer
#  title        :text
#  published_at :datetime
#  created_at   :datetime
#  updated_at   :datetime
#

class Video < ActiveRecord::Base
	belongs_to :user 


	def save_iframe
		iframe = "<iframe width=" + "525" + "height=" + "400" +
		"src=" + "//www.youtube.com/embed/#{unique_id} 
		frameborder=" + "0" + "allowfullscreen></iframe>"
		self.youtube_iframe = iframe
	end 

end
