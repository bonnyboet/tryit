class EquipmentListing < ApplicationRecord
  # user is the owner
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  validates :name, presence: true
  validates :description, presence: true, length: { in: 30..500 }
  validates :category, presence: true, inclusion: { in: %w[indoors outdoors winter] }
  validates :available, presence: true
  validates :hourly_rate, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :address, presence: true

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name, :category, :description ],
    using: {
      tsearch: { prefix: true }
    }
end
