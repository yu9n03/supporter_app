class Reservation < ApplicationRecord
  belongs_to :user

  validates :reservation_day, presence: true
  validates :reservation_time, presence: true
end
