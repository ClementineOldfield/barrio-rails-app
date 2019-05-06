class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def index
    @listings = Listing.all
  end

  def show

    @cart = current_user.carts.create(
      listing_id: @listing.id
    )
    
    stripe_session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      client_reference_id: @cart.id,
      customer_email: current_user.email,
      line_items: [{
        name: @listing.title,
        description: @listing.body,
        amount: @listing.price,
        currency: 'aud',
        quantity: 1,
      }],
      
      success_url: "http://localhost:3000/purchases/success?listing=#{@listing.id}",
      cancel_url: 'http://localhost:3000/purchases/cancel'
    ) 

    @stripe_session_id = stripe_session.id

    @cart.update(
      stripe_session_id: stripe_session.id
    )
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

