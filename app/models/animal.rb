class Animal < ApplicationRecord
  belongs_to :user
  has_many :locations, dependent: :destroy
  has_many :reviews, through: :locations
  validates :name, presence: true
  validates :species, presence: true
  validates :price_per_hour, presence: true
  has_one_attached :photo

  def average_rating
    reviews = self.reviews

    return 0 if reviews.empty?

    reviews.map(&:rating).sum / reviews.length.to_f
  end
end
