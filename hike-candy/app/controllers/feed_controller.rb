class FeedController < ApplicationController

  def feed
    @posts = Post.last(5)
    @trips = Trip.last(5)
  end

end
