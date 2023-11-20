class TripsController < ApplicationController
  def index
  end

  def new

  end

  def new

  end
  private

  def trips_params
    params.require(:article).permit(:origin, :destination, :time_of_departure, :time_of_arrrival, :number_of_people, :photo)
  end
end
