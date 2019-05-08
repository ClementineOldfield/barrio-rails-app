class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :about, :contact]
  before_action :clear_carts, only: [:dash]
  before_action :set_listings, only: [:dash, :favourites]
  before_action :set_categories, only: [:dash, :favourites]

  def index
    redirect_to dash_path if user_signed_in?
  end
  def about; end
  def contact; end

  def dash
    @favourites = current_user.favourite_listings
    @categories = Category.all
    @search = params["search"]
    if @search.present?
      @title = @search["title"]
      # @category = @search["category"]
      @listings = Listing.where("title ILIKE ?", "%#{@title}%")
      # @listings = Listing.where("category ILIKE ?", "%#{@category}%")
    end
  end

  def favourites; end

  def search
   
  end

  private
  
  # Clears all previous carts from the current user except for their most recent one 
  # (To cover cases in which the user may still have their last cart open in another window.)
  def clear_carts
    current_user.carts.each_with_index do |cart, i|
      cart.delete if i != current_user.carts.length - 1
    end
  end

  def set_listings
    @listings = Listing.all
  end

  def set_categories
    @categories = Category.all
  end
end
