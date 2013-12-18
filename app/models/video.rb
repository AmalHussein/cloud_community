# == Schema Information
#
# Table name: videos
#
#  id           :integer          not null, primary key
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
end
