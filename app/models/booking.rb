class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :equipment_listing
end
