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
end


