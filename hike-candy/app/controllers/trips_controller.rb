class TripsController < ApplicationController

  before_action :redirect_if_not_logged_in

  def index
    @trips = Trip.all
  end

  def show
    @user = User.find(session[:user_id])
    @trip = Trip.find(params[:id])
    @follow = @trip.user
    @comment = Comment.new(commentable: @trip)
    @comments = Comment.trip_comments.select {|comment| comment.commentable_id == params[:id].to_i}
  end

  def new
    @trip = Trip.new
    @errors = @trip.errors
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user_id = session[:user_id]

    if @trip.save
      redirect_to @trip
    else
      @errors = @trip.errors.full_messages
      render :new
    end

  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to feed_path
  end


private

  def trip_params
    params.require(:trip).permit(:title, :rating, :content, :date, :region)
  end

end
