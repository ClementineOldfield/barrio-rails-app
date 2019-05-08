class AddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_defaults, only: [:new]
  before_action :redirect_if_address_exists, only: [:new]
  # skip_before_action :verify_authenticity_token

  def index
    # @address = Address.order('created_at DESC')
    concat_address
  end

  def new
    @address = current_user.create_address
    @states = Address.states.keys
  end

  def concat_address
    byebug
    @concat_address = [current_user.address.street_1, current_user.address.street_2, current_user.address.suburb, current_user.address.state, current_user.address.postcode].compact.join(' ')
    puts "concat address"
  end

  def create
    current_user.create_address(address_params)
    redirect_to edit_user_path(current_user.id)
  end

  def update
    @address = current_user.address
    @address.update(address_params)
    redirect_to edit_user_path(current_user.id)
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
  
  def redirect_if_address_exists
    redirect_to dash_path if current_user.address != nil
  end
end