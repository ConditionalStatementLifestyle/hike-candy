class CommentsController < ApplicationController

  def create
    @comment = Comment.new(user_params)
    @comment.user_id = session[:user_id]
    @comment.commentable_id = params["commentable_id"]
    @comment.commentable_type = params["commentable_type"]
    @comment.save
    redirect_back(fallback_location: root_path)
  end

  private
    def user_params
      params.require(:comment).permit(:content, :commentable_type, :commentable_id)
    end

end
