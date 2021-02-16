class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :animals, through: :locations, as: :rented_animals
  has_many :animals, dependent: :destroy
  has_many :locations
  has_one_attached :photo
  has_one_attached :banner_photo
end
