class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  #has_one :image, as: :imageable
  has_one_attached :image
end
