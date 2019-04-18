class CommentsController < ApplicationController

  def create
    @comment = Comment.new(user_params)
    @comment.user_id = session[:user_id]
    @comment.commentable_id = params["commentable_id"]
    @comment.commentable_type = params["commentable_type"]
    @comment.save
    if @comment.commentable_type == "Post"
      redirect_to "/posts/#{@comment.commentable_id}"
    else
      redirect_to "/trips/#{@comment.commentable_id}"
    end
  end

  private
    def user_params
      params.require(:comment).permit(:content, :commentable_type, :commentable_id)
    end

end
