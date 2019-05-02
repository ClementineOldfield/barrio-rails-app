class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :about, :contact]

  def index; end
  def about; end
  def contact; end

  def dash
    @listings = Listing.all
    @favourites = current_user.favourite_listings
  end

end
