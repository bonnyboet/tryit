class EquipmentListing < ApplicationRecord
  #user is the owner
  belongs_to :user
  has_many :bookings

  validates :name, presence: true
  validates :description, presence: true, length: { in: 30..500 }
  validates :category, presence: true, inclusion: { in: %w[indoors outdoors winter] }
  validates :available, presence: true
  validates :hourly_rate, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
