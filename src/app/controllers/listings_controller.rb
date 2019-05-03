class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def index
    @listings = Listing.all
  end

  def show
    
    # session = Stripe::Checkout::Session.create(
    #   payment_method_types: ['card'],
    #   line_items: [{
    #     name: @listing.title,
    #     description: @listing.body,
    #     # image: ['https://example.com/t-shirt.png'],
    #     amount: @listing.price,
    #     currency: 'aud',
    #     quantity: 1,
    #   }],
    #   success_url: 'https://localhost:3000/success',
    #   cancel_url: 'https://localhost:3000/cancel',
    # )

  end
  
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
    redirect_to listing_path params[:listing]
  end

  def unset_favourite
    current_user.favourite_listings.delete params[:listing]
    redirect_to listing_path params[:listing]
  end

  private 

  def set_listing
    @id = params[:id]
    @listing = Listing.find(@id)
  end

  def authorize_user
    unless current_user.listings.include? @listing
      redirect_to dash_path
    end
  end
end
