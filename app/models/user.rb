class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :animals, dependent: :destroy
  has_many :locations

  has_many :rented_animals, through: :locations, source: :animal
  has_many :animals_required, through: :animals, source: :locations
  
  scope :pending, -> { where( status: "pending")}

  has_one_attached :photo
  has_one_attached :banner_photo



end
