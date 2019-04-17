class ApplicationController < ActionController::Base
  helper_method :logged_in?

  # def redirected_user_login_path
  #   if !logged_in?
  #     redirect_to login_path
  #   end
  # end

  def logged_in?
    !session[:user_id].nil?
  end

end
