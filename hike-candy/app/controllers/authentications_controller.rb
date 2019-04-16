class AuthenticationsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:authentication][:username])
    if @user && @user.authenticate(params[:authentication][:password])
      session[:user_id] = @user.id
      byebug
      redirect_to '/feed'
    else
      @errors = @user.errors.full_messages
      redirect_to :login
    end
  end

  def destroy
  end



end
