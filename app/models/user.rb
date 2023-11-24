class User < ApplicationRecord
  has_one_attached :avatar
  has_many :bookings, dependent: :destroy
  has_many :trips, through: :bookings
  has_many :pre_bookings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true
  before_save :capitalize

  private

  def capitalize
    first_name.capitalize!
    last_name.capitalize!
  end
end
