class VideosController < ApplicationController

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

  def index
  	@videos = Video.all 
  end

  def show
  	@video = Video.find(params[:id])

  end

end
