class FeedController < ApplicationController

  before_action :redirect_if_not_logged_in

  def feed
    @posts = Post.last(5)
    @trips = Trip.last(5)
  end

end
