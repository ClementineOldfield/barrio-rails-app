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
  
  def clear_carts
    current_user.carts.each do |cart|
      cart.delete
    end
  end
end
