class Booking < ApplicationRecord
  belongs_to :renter, class_name: "User"
  belongs_to :owner, class_name: "User"
  belongs_to :equipment_listing
end
