class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  validates :user_id, :listing_id, :total_amount, :quantity, :stripe_transaction_id, presence:true
end
