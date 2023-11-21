class Trip < ApplicationRecord
  # has_one_attached :photo
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :origin, presence: true
  validates :destination, presence: true
  validates :time_of_departure, presence: true
  validates :time_of_arrival, presence: true
  validates :number_of_people, presence: true
  validates :user_id, presence: true
end
