class PreBookingsController < ApplicationController
  before_action :find_trip, only: %i[create new]
  before_action :find_pre_booking, only: [:destroy]
  def new
    @pre_booking = PreBooking.new
  end

  def create
    @pre_booking = PreBooking.new(bookings_params)
    @pre_booking.user = current_user
    @pre_booking.trip = @trip
    if @pre_booking.save
      redirect_to @trip
    else
      render "trips/show", status: :unprocessable_entity
    end
  end

  def destroy
    @pre_booking.destroy
    redirect_to dashboards_path, status: :see_other
  end

  private

  def find_trip
    @trip = Trip.find(params[:trip_id])
  end

  def find_pre_booking
    @pre_booking = Booking.find(params[:id])
  end

  def bookings_params
    params.require(:pre_booking).permit(:number_of_people, :comment)
  end
end
