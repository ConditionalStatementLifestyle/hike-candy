class UsersController < ApplicationController

  before_action :redirect_if_not_logged_in, except: [:new,:create]

  def index
    @users = User.all
  end

  def show
    @user = User.find(session[:user_id])
    @follow = User.find(params[:id])
    @event_user_id = @follow.id
    @following_relationships = @follow.active_relationships
    @follower_relationships = @follow.passive_relationships

    current_user = User.find(params[:id])

    @followingcount = @following_relationships.count
    @followercount = @follower_relationships.count

    @followingobjects = @following_relationships.map do |ar|
      User.find(ar.followed_id)
    end

    @followerobjects = @follower_relationships.map do |pr|
      User.find(pr.follower_id)
    end

    @posts = @follow.posts.last(5)
    @trips = @follow.trips.last(5)
  end



  def new
    @user = User.new
  end



  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to '/feed'
    else
      @errors = @user.errors.full_messages
      render '/users/new'
    end
  end




  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :password_confirmation, :password)
    end

end
