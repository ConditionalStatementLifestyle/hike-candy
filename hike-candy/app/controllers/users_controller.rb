class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    byebug
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
