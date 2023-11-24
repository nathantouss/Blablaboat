class BookingsController < ApplicationController
  before_action :find_booking, only: [:destroy]
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    find_pre_booking
    @booking = Booking.new
    @booking.user = @pre_booking.user
    @booking.trip = @pre_booking.trip
    @booking.number_of_people = @pre_booking.number_of_people
    @booking.save
    @pre_booking.destroy
    redirect_to @booking.trip
  end

  def destroy
    @booking.destroy
    redirect_to @booking.trip, status: :see_other
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def find_pre_booking
    @pre_booking = PreBooking.find(params[:pre_booking_id])
  end
end
