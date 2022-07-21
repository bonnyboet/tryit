class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :equipment_listing

  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  # add this gem later for time validation
  # https://github.com/adzap/validates_timeliness
end
