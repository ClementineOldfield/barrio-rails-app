class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  #has_one :image, as: :imageable
  has_one_attached :image
  has_many :favourited_users, through: :favourites, source: :user
  has_many :carts
end
