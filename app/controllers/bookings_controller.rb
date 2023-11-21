class BookingsController < ApplicationController
  before_action :find_trip, only: [:create, :destroy]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(bookings_params)
    @booking.user = current_user
    @booking.trip = @trip
    if @booking.save
      redirect_to @trip
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to @trip, status: :see_other
  end

  private

  def find_trip
    @trip = Trip.find(params[:trip_id])
  end

  def bookings_params
    params.require(:booking).permit(:number_of_people)
  end
end