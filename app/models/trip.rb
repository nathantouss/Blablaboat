class Trip < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :bookings, dependent: :destroy

  geocoded_by :origin,
              latitude: :origin_latitude,
              longitude: :origin_longitude

  geocoded_by :destination,
              latitude: :destination_latitude,
              longitude: :destination_longitude

  before_save :geocode_endpoints, :capitalize


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

  private

  def geocode_endpoints
    if origin_changed?
      geocoded = Geocoder.search(origin).first
      if geocoded
        self.origin_latitude = geocoded.latitude
        self.origin_longitude = geocoded.longitude
      end
    end
    if destination_changed?
      geocoded = Geocoder.search(destination).first
      if geocoded
        self.destination_latitude = geocoded.latitude
        self.destination_longitude = geocoded.longitude
      end
    end
  end

  def capitalize
    origin.capitalize!
    destination.capitalize!
  end
end
