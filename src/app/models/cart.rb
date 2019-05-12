class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  validates :listing_id, :user_id, presence:true
end
