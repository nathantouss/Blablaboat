class Trip < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :origin, presence: true
  validates :destination, presence: true
  validates :time_of_departure, presence: true
  validates :time_of_arrival, presence: true
  validates :number_of_people, presence: true
  validates :user_id, presence: true

  def seat_available
    seat_taken = 0
    bookings.each do |booking|
      seat_taken += booking.number_of_people
    end
    return number_of_people - seat_taken
  end
end
