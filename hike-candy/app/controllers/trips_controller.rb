class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def show
    @user = User.find(session[:user_id])
    @follow = User.find(params[:id])
    # byebug
    @trip = Trip.find(params[:id])
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


private

  def trip_params
    params.require(:trip).permit(:title, :rating, :content, :date, :region)
  end

end
