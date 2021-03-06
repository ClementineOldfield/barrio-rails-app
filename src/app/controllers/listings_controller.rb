class ListingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_listing, only: [:show, :confirmation, :edit, :update, :deactivate, :reactivate, :set_favourite, :unset_favourite]
  before_action :authorize_user, only: [:edit, :update, :destroy]
  before_action :is_owner?, only: [:show, :edit]
  before_action :set_categories, only: [:edit, :new]
 
  def index
    @listings = Listing.all
  end

  def show
    
  end

  def confirmation
    @quantity = params[:quantity].to_i
    @total_amount = @quantity * @listing.price

    @cart = current_user.carts.create(
      listing_id: @listing.id,
      quantity: @quantity
    )

    domain = request.base_url
    stripe_session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      client_reference_id: @cart.id,
      customer_email: current_user.email,
      line_items: [{
        name: @listing.title,
        description: @listing.body,
        amount: @listing.price,
        currency: 'aud',
        quantity: @quantity,
      }],
      
      success_url: "http://barrio-2019.herokuapp.com/purchases/success?cart=#{@cart.id}",
      cancel_url: "http://barrio-2019.herokuapp.com/purchases/cancel"
    ) 

    @stripe_session_id = stripe_session.id

    @cart.update(
      stripe_session_id: stripe_session.id
    )

    #Would like to refactor this code into a new method since it is called multiple times and not very dry.
    user = User.find(@listing.user_id)
    user.notifications.create(
      title: "Your listing has been purchased",
      body: "#{current_user.first_name} has bought your listing #{@listing.title}",
      read: false,
    )
  end

  def create
    @listing = current_user.listings.create(
      image: params[:listing][:featured_image],
      title: params[:listing][:title],
      body: params[:listing][:body],
      price: params[:listing][:price],
      quantity: params[:listing][:quantity],
      category_id: params[:listing][:category_id],
      active: true
    )
    @listing.save!
    redirect_to listing_path(@listing.id)
  end

  def new
    @listing = Listing.new
  end

  def edit
    unless @listing.active or @is_owner
      redirect_to dash_path
    end

  end

  def update
    newImage = params[:listing][:featured_image]
    @listing.update(listing_params)
    @listing.update( image: newImage ) if newImage != nil
    
    favourited_users = @listing.favourited_users
    favourited_users.each do |user| 
      user.notifications.create(
        title: "Someone edited your favourite",
        body: "#{current_user.first_name} has edited your favourite #{listing.title}",
        read: false,
      )
    end

    redirect_to listing_path

  end
  
  #Decided not to use .toggle here to be more explicitly RESTful 
  def deactivate
    @listing.update(
      active: false
    )
    flash[:notice] = "You have successfully deactivated your listing."
    redirect_to user_path(current_user.id)

    favourited_users = @listing.favourited_users
    favourited_users.each do |user|
      user.notifications.create(
        title: "Someone deactivated your favourite",
        body: "#{current_user.first_name} has deactivated your favourite #{@listing.title}",
        read: false,
      )
    end
  end

  def reactivate
    @listing.update(
      active: true
    )
    flash[:notice] = "You have successfully reactivated your listing."

    favourited_users = @listing.favourited_users
    favourited_users.each do |user|
      user.notifications.create(
        title: "Someone reactivated your favourite",
        body: "#{current_user.first_name} has reactivated your favourite #{@listing.title}",
        read: false,
      )
    end

    redirect_to user_path(current_user.id)
  end

  def set_favourite
    favourite = Favourite.new(
      listing_id: params[:listing],
      user_id: current_user[:id]
    )
    favourite.save!
    user = User.find(@listing.user_id)
    @listing.notifications.create(
      user_id: user.id,
      title: "Someone favourited your listing",
      body: "#{current_user.first_name} is interested in your listing: #{@listing.title}",
      read: false,
    )

    redirect_to listing_path params[:listing]
  end

  def unset_favourite
    current_user.favourite_listings.delete params[:listing]
   

    user = User.find(@listing.user_id)
    user.notifications.create(
      title: "Your listing lost one FAV",
      body: "#{current_user.first_name} is not interested in your listing #{@listing.title} any more",
      read: false,
    )

    redirect_to listing_path params[:listing]
  end

  private 

  def set_listing
    @id = params[:id]
    @listing = Listing.find(@id)
  end

  def set_categories
    @categories = Category.all
  end

  def is_owner?
    @is_owner = (@listing.user.id == current_user.id)
  end

  def listing_params
    new_params = params.require(:listing).permit(:image, :title, :body, :price, :quantity, :category_id)
  end

  def authorize_user
    unless current_user.listings.include? @listing
      redirect_to dash_path
    end
  end

end

