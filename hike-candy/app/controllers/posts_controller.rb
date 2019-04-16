class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @errors = @post.errors
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      @errors = @post.errors.full_messages
      render :new
    end
  end


private
  def post_params
    params.require(:post).permit(:title, :description)
  end

end
