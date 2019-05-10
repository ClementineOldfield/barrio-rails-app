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
  has_many :carts
  has_many :notifications
  has_many :conversations
  has_many :messages

  # instead of deleting, indicate the user requested a delete & timestamp it  
  def soft_delete  
    update_attribute(:deleted_at, Time.current)
    listings.each do |listing|
      listing.update(
        active: false
      )
    end 
  end  
  
  # ensure user account is active  
  def active_for_authentication?  
    super && !deleted_at  
  end  
  
  # provide a custom message for a deleted account   
  def inactive_message   
  	!deleted_at ? super : :deleted_account  
  end  
end


