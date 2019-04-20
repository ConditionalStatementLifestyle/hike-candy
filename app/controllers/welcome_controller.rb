class WelcomeController < ApplicationController

  def welcome
    if session[:username] != nil
      redirect_to "/feed"
    end
  end

end
