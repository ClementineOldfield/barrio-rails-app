class AddressesController < ApplicationController
  before_action :authenticate_user!
  # skip_before_action :verify_authenticity_token

  def index
    # @address = Address.order('created_at DESC')
    concat_address
  end

  def new
    @address = current_user.address
    @states = Address.states.keys
  end

  def concat_address
    byebug
    @concat_address = [current_user.address.street_1, current_user.address.street_2, current_user.address.suburb, current_user.address.state, current_user.address.postcode].compact.join(' ')
    puts "concat address"
  end

  def create; end

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