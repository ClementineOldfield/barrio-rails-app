class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :listings
  has_one :address, dependent: :destroy
  has_many :purchases
  has_many :favourites
  has_many :favourite_listings, through: :favourites, source: :listing
  has_one_attached :image
end


