class BookingsController < ApplicationController
  before_action :find_trip, only: [:create, :new]
  before_action :find_booking, only: [:destroy, :update]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(bookings_params)
    @booking.user = current_user
    @booking.trip = @trip
    @booking.status = "pending"
    if @booking.save
      redirect_to @trip
    else
      render :new, status: :unprocessable_entity
      # , alert: @booking.errors.messages.values.flatten
    end
  end

  def update
    @booking.update(bookings_params)
    redirect_to dashboards_path
  end

  def destroy
    @booking.destroy
    redirect_to @booking.trip, status: :see_other
  end

  private

  def find_trip
    @trip = Trip.find(params[:trip_id])
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def bookings_params
    params.require(:booking).permit(:number_of_people, :status)
  end
end
