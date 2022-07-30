class EquipmentListing < ApplicationRecord
  # user is the owner
  CATEGORY = [
    'Archery',
    'Ball & Net',
    'Bat & Ball',
    'Board',
    'Climbing',
    'Cycling',
    'Combat',
    'Snow Sports',
    'Aquatic Sports',
    'Others'
  ]

  belongs_to :user
  has_many :bookings
  has_many :reviews
  has_one_attached :photo

  validates :name, presence: true
  validates :description, presence: true, length: { in: 30..500 }
  validates :category, presence: true, inclusion: { in: CATEGORY }
  validates :available, presence: true
  validates :hourly_rate, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name, :category, :description ],
    using: {
      tsearch: { prefix: true }
    }
end
