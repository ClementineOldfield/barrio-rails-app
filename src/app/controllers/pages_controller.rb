class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :about, :contact]
  before_action :clear_carts, only: [:dash]
  # before_action :set_listings, only: [:dash, :favourites]
  before_action :set_active_listings, only: [:dash, :favourites]
  before_action :set_categories, only: [:dash, :favourites]
  before_action :check_address, only: [:dash, :favourites]

  def index
    redirect_to dash_path if user_signed_in?
  end

  def about; end
  def contact; end
  def contact_success; end

  def privacy; end

  def dash
    @favourites = current_user.favourite_listings.where(active: true)
  
    @search = params["search"]
    if @search.present?
      @keyword = @search["keyword"]
      @body = @search["keyword"]
      @cats = @categories.where("name ILIKE ?", "%#{@keyword}%").pluck(:id)
      @listings = @listings.where("title ILIKE ?", "%#{@keyword}%").or(Listing.where(category_id: @cats)).or(Listing.where("body ILIKE ?", "%#{@keyword}%"))
    end
    @listings = @favourites if params[:listings].present?
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

  def set_active_listings
    @listings = Listing.all.where(active:true)
  end

  def set_categories
    @categories = Category.all
  end

  def check_address
    redirect_to new_address_path if current_user.address == nil
  end

  def set_notification_as_read
    notifications.each  do |notification|
      notification.update(read: true)
    end
  end

end
