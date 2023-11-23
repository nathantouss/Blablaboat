class TripsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :find_trip, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    params[:query].present? ? @trips = Trip.where("origin ILIKE ?", "%#{params[:query]}%") : @trips = Trip.all
    @markers = @trips.geocoded.map do |trip|
      {
        lat: trip.origin_latitude,
        lng: trip.origin_longitude,
        info_window_html: render_to_string(partial: "shared/info_window", locals: { trip: trip }),
        marker_html: render_to_string(partial: "shared/marker", locals: { marker: "departure.png" })
      }
    end
  end

  def show
    @markers = [{
      lat: @trip.origin_latitude,
      lng: @trip.origin_longitude,
      marker_html: render_to_string(partial: "shared/marker", locals: { marker: "departure.png" }),
      info_window_html: "Origin"
    },
    {
      lat: @trip.destination_latitude,
      lng: @trip.destination_longitude,
      info_window_html: "Destination",
      marker_html: render_to_string(partial: "shared/marker", locals: { marker: "arrival.png" })    }]
  end

  def new
    @trip = Trip.new
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
    params.require(:trip).permit(:origin, :destination, :time_of_departure, :time_of_arrival, :number_of_people, :photo,
    :user, :description, :price)
  end
end
