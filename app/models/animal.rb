class Animal < ApplicationRecord
  belongs_to :user
  has_many :locations
  has_many :reviews, through: :locations
  validates :name, presence: true
  validates :species, presence: true
  validates :price_per_hour, presence: true
  has_one_attached :photo
end
