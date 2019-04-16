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
    if @user.valid?
      @user.save
      redirect_to @user
    else
      @errors = @user.errors.full_messages
      render :new
    end
  end




  private
    def user_params(params)
      params.require(:user).permit(:first_name, :last_name, :username)
    end

end
