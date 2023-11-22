class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :trip

  validates :number_of_people, presence: true, numericality: { less_than: :seat_available,
                                                               message: "Not engough seats available on this trip" }
  validates_associated :user
  validates_associated :trip
  validates :trip, presence: true, uniqueness: { scope: :user, message: "You already have a booking for this trip" }
  validates :user, presence: true

  private

  def seat_available
    seat_taken = 0
    trip.bookings.each do |booking|
      seat_taken += booking.number_of_people
    end
    return trip.number_of_people - seat_taken
  end
end
