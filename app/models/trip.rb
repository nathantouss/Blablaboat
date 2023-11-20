class Trip < ApplicationRecord
  has_one_attached :photo
  belong_to :user

  validates :origin, :presence
  validates :destination, :presence
  validates :time_of_departure, :presence
  validates :time_of_arrrival, :presence
  validates :number_of_people, :presence
  validates :user_id, :presence
end
