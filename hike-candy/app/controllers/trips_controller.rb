class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
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
