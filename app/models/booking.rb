class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :equipment_listing

  validates :book_from, presence: true
  validates :book_to, presence: true
  # add this gem later for time validation
  # https://github.com/adzap/validates_timeliness
end
