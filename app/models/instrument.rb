# == Schema Information
#
# Table name: instruments
#
#  id          :integer          not null, primary key
#  name        :text
#  image_icon  :text
#  hover_icon  :text
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Instrument < ActiveRecord::Base
	has_and_belongs_to_many :users
end
