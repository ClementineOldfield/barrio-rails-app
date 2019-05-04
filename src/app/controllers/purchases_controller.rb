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
    p params
    
    @params = params[:data][:object]
    @item = @params[:display_items][0]
    @user = User.find_by_email(@params[:customer_email])

    @user.purchases.create(
      listing: Listing.find(@params[:client_reference_id]),
      total_amount: @item[:amount],
      quantity: @item[:quantity]
    )
    puts "\n\n\n\n\n\n\n -----------------------\nCREATED PURCHASE\n----------------------- \n\n\n\n\n\n\n\n"

    render plain: ""
  end

  def success
    @purchase = current_user.purchases.last
  end
end
