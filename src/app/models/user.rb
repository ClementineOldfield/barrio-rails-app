class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :listings
  has_one :address, dependent: :destroy
  has_many :purchases
  has_one :image, as: :imageable, dependent: :destroy
  has_one_attached :image
end


