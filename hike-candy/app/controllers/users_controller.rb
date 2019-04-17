class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])


    current_user = User.find(session[:user_id])
    @following_relationships = current_user.active_relationships
    @follower_relationships = current_user.passive_relationships
    @followingcount = @following_relationships.count
    @followercount = @follower_relationships.count

    @followingobjects = @following_relationships.map do |ar|
      User.find(ar.followed_id)
    end

    @followerobjects = @follower_relationships.map do |pr|
      User.find(pr.follower_id)
    end


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
      redirect_to :signup
    end
  end




  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :password_confirmation, :password)
    end

end
