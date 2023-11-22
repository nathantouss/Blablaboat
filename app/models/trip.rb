class Trip < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :origin, presence: true
  validates :destination, presence: true
  validates :time_of_departure, presence: true
  validates :time_of_arrival, presence: true
  validates_datetime :time_of_arrival, { after: :time_of_departure,
                                         message: "must be after or same as time of departure" }
  validates :number_of_people, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :user_id, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def seat_available
    seat_taken = 0
    bookings.each do |booking|
      seat_taken += booking.number_of_people
    end
    return number_of_people - seat_taken
  end
end
