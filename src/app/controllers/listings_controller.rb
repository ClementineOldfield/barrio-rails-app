class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  def index
    @listings = Listing.all
  end

  def show; end
  
  def create; end
  def new; end

  def edit; end
  def update
    new_params = params[:listing]
    @listing.update(
      image: new_params[:featured_image],
      title: new_params[:title],
      body: new_params[:body],
      price: new_params[:price],
      quantity: new_params[:quantity]
    )
    redirect_to listing_path
  end
  
  def destroy; end

  def set_favourite
    favourite = Favourite.new(
      listing_id: params[:listing],
      user_id: current_user[:id]
    )
    favourite.save!
    puts "created #{favourite}"
  end

  private 

  def set_listing
    @id = params[:id]
    @listing = Listing.find(@id)
  end
end
