class PurchasesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @purchases = current_user.purchases
  end

  def create
    @item = Listing.find(params[:id])
    @purchase = current_user.purchases.new()
  end

  def stripe
    puts "----------------------\n\n\n\n\n\n"
    p params
    puts "----------------------\n\n\n\n\n\n"
    @params = params[:data][:object]
    @cart = Cart.find(@params[:client_reference_id])
    @listing = Listing.find(@cart.listing.id)
    @user = User.find_by_email(@params[:customer_email])

    @item_params = @params[:display_items][0]

    @user.purchases.create(
      listing: @listing,
      total_amount: @item_params[:amount] * @item_params[:quantity],
      quantity: @item_params[:quantity]
    )

    remaining_stock = @listing.quantity - @cart.quantity
    
    @listing.update(
      quantity: remaining_stock
    )
    puts "Removing #{@cart.quantity} items from #{@listing} stock"

    puts "\n\n\n\n\n\n\n -----------------------\nCREATED PURCHASE\n----------------------- \n\n\n\n\n\n\n\n Listing = #{Listing.find(@listing_id)}"

    render plain: ""
  end

  def success
    @cart = Cart.find(params[:cart])
  end
end
