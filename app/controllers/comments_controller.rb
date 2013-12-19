class CommentsController < ApplicationController

  def index
  	@commentable = Video.find(params[:video_id])
  	@comments = @commentable.comments
  end

  def new
  end

  def update
  end

  def edit
  end
end
