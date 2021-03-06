class AddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_defaults, only: [:new]
  before_action :redirect_if_address_exists, only: [:new]

  def index
    concat_address
    others_offers
  end

  def new
    @show_errors = true
    @address = current_user.create_address
    @states = Address.states.keys
    @show_errors = false if params[:show_errors] == nil
  end

  def others_offers
    # @offers = [User.all.address.street_1, User.all.address.street_2, User.all.address.suburb, User.all.address.state, User.all.address.postcode].compact.join(' ')
    @others_offers = []
    users = User.all
  
    users.each do |user|
      if (user != current_user) && (user.listings.count > 0)
        # listings.where(active: true)
        user_address = [user.address.street_1, user.address.street_2, user.address.suburb, user.address.state, user.address.postcode].compact.join(" ")
        @others_offers << user_address
      end
    end
 
  end

  def create
    @address = current_user.create_address(address_params)
    if @address.errors.any?
      redirect_to new_address_path(show_errors: true)
    else
      redirect_to edit_user_path(current_user.id)
    end
  end

  def update
    @address = current_user.address
    @address.update(address_params)
    redirect_to edit_user_path(current_user.id)
  end

  private

  def concat_address
    @concat_address = [current_user.address.street_1, current_user.address.street_2, current_user.address.suburb, current_user.address.state, current_user.address.postcode].compact.join(' ')
  end

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