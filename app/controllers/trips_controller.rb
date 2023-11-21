class TripsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :find_trip, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @trips = Trip.all
  end

  def show
  end

  def new
    @trip = Trip.new
    if user_sign_in?
      render :new
    else
      render "shared/flashes", status: :forbidden
    end
  end

  def create
    @trip = Trip.new(trips_params)
    @trip.user = current_user
    if @trip.save
      redirect_to trip_path(@trip)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @trip.update(trips_params)
  end

  def destroy
    @trip.destroy
    # redirect_to !!!! Dashboard !!!!, status: :see_other
  end

  private

  def find_trip
    @trip = Trip.find(params[:id])
  end

  def trips_params
    params.require(:trip).permit(:origin, :destination, :time_of_departure, :time_of_arrrival, :number_of_people, :photo, :user)
  end
end
