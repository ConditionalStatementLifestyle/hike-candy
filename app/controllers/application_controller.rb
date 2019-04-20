class ApplicationController < ActionController::Base
  helper_method :logged_in?


  def logged_in?
    !session[:user_id].nil?
  end

  def redirect_if_not_logged_in
    redirect_to "/login" if !logged_in?
  end

end
