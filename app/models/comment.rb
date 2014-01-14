# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  content          :text
#  commentable_type :text
#  commentable_id   :integer
#  time             :datetime
#  like             :boolean
#  created_at       :datetime
#  updated_at       :datetime
#

class Comment < ActiveRecord::Base
	belongs_to :commentable, polymorphic: true
end





