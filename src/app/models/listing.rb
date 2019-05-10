class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category 

  validates :title, :body, :price, :quantity, presence:true

  #has_one :image, as: :imageable
  has_one_attached :image
  has_many :favourites
  has_many :favourited_users, through: :favourites, source: :user
  has_many :carts
  has_many :notifications, as: :notificationable
end
