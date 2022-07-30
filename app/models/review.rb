class Review < ApplicationRecord
  belongs_to :equipment_listing

  validates :content, presence: true, length: { minimum: 10 }
end
