class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :about, :contact]
  before_action :clear_carts, only: [:dash]

  def index; end
  def about; end
  def contact; end

  def dash
    @listings = Listing.all
    @favourites = current_user.favourite_listings
    
  end

  private
  
  # Clears all previous carts from the current user except for their most recent one 
  # (To cover cases in which the user may still have their last cart open in another window.)
  def clear_carts
    current_user.carts.each_with_index do |cart, i|
      cart.delete if i != current_user.carts.length - 1
    end
  end
end
