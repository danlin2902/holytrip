class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :destroy, :update]

  def index
    @trips = Trip.where(user: current_user)
  end

  def show
  end

  def new
    @trip = Trip.new

    # @trip = Trip.where.not(latitude: nil, longitude: nil)

    # @markers = @trips.map do |trip|
    #   {
    #     lat: trip.latitude,
    #     lng: trip.longitude
    #   }
    # end
  end


  def create
    @trip = Trip.new(trip_params)
    @trip.user = current_user
    if @trip.save
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @trip.update(trip_params)
    redirect_to trip_path(@trip)
  end

  def destroy
    @trip.destroy
    redirect_to trips_path
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :destination, :start_date, :end_date, :photo)
  end

  def set_trip
    @trip = Trip.find(params[:id])
  end
end
