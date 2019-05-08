class AddressesController < ApplicationController
  before_action :authenticate_user!
  # skip_before_action :verify_authenticity_token

  def index
    # @address = Address.order('created_at DESC')
  end

  def new
    @address = current_user.address
    @states = Address.states.keys
  end

  def address
    [:street1, :street2, :suburb, :state, :postcode].compact.join(', ')
  end

  def create
    current_user.create_address(address_params)
  end

  def update
    @address = current_user.address
    @address.update(address_params)
    redirect_to profile_image_upload_path(current_user.id)
  end

  private

  def address_params
    params.require(:address).permit(:street_1, :suburb, :state, :postcode)
  end
end