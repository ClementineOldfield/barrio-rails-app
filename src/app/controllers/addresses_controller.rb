class AddressesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    # @address = Address.order('created_at DESC')
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
  end
  
  def address
    [:street1, :street2, :suburb, :state, :postcode].compact.join(', ')
  end

  private

  def address_params
    params.require(:address).permit(:street1, :street2, :suburb, :state, :postcode)
  end
end