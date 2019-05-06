class Address < ApplicationRecord
  belongs_to :user
  # geocoded_by :address
  # ,:latitude, :longitude
  # after_validation :geocode, if: -> (obj){ obj.address.present? and obj.address_changed? }
  # :if => :address_changed?

  def address
    [:street1, :street2, :suburb, :state, :postcode].compact.join(', ')
  end
  
end
