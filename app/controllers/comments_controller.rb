class CommentsController < ApplicationController

	before_filter :load_commentable

  def index
  	@comments = @commentable.comments
  end

  def new
  	@comment = @commentable.comments.new 
  end


  def create
    @comment = @commentable.comments.new(comment_params)
    if @comment.save
      redirect_to [@commentable.user, @commentable], notice: "Comment created."
    else
      render :new
    end
  end

  def update
  end

  def edit
  end

  private 

  def load_commentable 
  	resource, id = request.path.split('/')[3, 4]
  	@commentable = resource.singularize.classify.constantize.find(id)
  end 

  def comment_params
  	params.require(:comment).permit(:user_id, :song_id, :video_id, :content, :comment, :time) 
  end 

end
