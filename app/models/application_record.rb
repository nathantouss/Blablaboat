class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def seat_available(trip)
    seat_taken = 0
    trip.bookings.each do |booking|
      seat_taken += booking.number_of_people
    end
    return trip.number_of_people - seat_taken
  end
end
