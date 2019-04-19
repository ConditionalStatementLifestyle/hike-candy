class AuthenticationsController < ApplicationController


  def new
    @user = User.new
    @errors = []
  end

  def create
    @user = User.find_by(username: params[:authentication][:username])
    if @user && @user.authenticate(params[:authentication][:password])
      session[:user_id] = @user.id
      session[:username] = @user.username
      redirect_to '/feed'
    elsif @user
      @errors = []
      @errors << "Those credentials do not match.  Try again!"
      render 'authentications/new'
    else
      @errors = []
      @errors << "Those credentials do not match.  Try again!"
      render 'authentications/new'
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end



end
