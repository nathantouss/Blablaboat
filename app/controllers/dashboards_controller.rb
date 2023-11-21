class DashboardsController < ApplicationController
  def index
    @trips = Trip.where(user: current_user)
    @bookings = Booking.where(user: current_user)
  end
end
