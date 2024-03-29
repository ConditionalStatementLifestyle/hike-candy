class PostsController < ApplicationController

  before_action :redirect_if_not_logged_in

  def index
    @posts = Post.all.reverse
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(session[:user_id])
    @follow = @post.user
    @event_user_id = @follow.id
    @comment = Comment.new(commentable: @post)
    @comments = Comment.post_comments.select {|comment| comment.commentable_id == params[:id].to_i}

  end

  def new
    @post = Post.new
    @errors = @post.errors
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = session[:user_id]
      if @post.save
        redirect_to @post
      else
        @errors = @post.errors.full_messages
        render :new
      end

    end

    def edit
      @post = Post.find(params[:id])
    end

    def update
      @post = Post.find(params[:id])
      @post.update(title: post_params['title'], description: post_params['description'])
      redirect_to post_path(@post)
    end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to feed_path
  end



private

  def post_params
    params.require(:post).permit(:title, :description)
  end

end
