class AddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_defaults, only: [:new]
  # skip_before_action :verify_authenticity_token

  def index
    # @address = Address.order('created_at DESC')
  end

  def new
    @address = current_user.create_address
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

  def set_defaults

    current_user.update(
      bio: "lorem ipsum" 
    )
    current_user.image.attach(io: File.open('app/assets/images/default_profile.png'), filename: 'default_profile.png', content_type: 'image/png')
  end
end