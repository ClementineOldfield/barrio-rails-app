class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one :image, as: :imageable
end
