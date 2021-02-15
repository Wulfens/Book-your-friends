class Review < ApplicationRecord
  belongs_to :location
  validates :rating, presence: true
  validates :rating, numericality: { only_integer: true }
  validates_inclusion_of :rating, in: 0..5
end
