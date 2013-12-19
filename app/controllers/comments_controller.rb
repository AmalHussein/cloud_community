class CommentsController < ApplicationController

	before_filter :load_commentable

  def index
  	#binding.pry
  	@comments = @commentable.comments
  end

  def new
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

end
