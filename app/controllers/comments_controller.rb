class CommentsController < ApplicationController

	before_filter :load_commentable

  def index
  	@comments = @commentable.comments
    render :index, layout: false 
  end

  def new
  	@comment = @commentable.comments.new 
    render :new, layout: false
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.html {redirect_to [@commentable.user, @commentable], notice: "Comment created."}
        format.js 
      end 
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
