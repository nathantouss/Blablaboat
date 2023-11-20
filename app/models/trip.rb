class Trip < ApplicationRecord
  has_one_attached :photo
  belongs_to :user

  validates :origin, presence: true
  validates :destination, presence: true
  validates :time_of_departure, presence: true
  validates :time_of_arrrival, presence: true
  validates :number_of_people, presence: true
  validates :user_id, presence: true
end
