class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy, :listings]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def create

  end

  def update 
    #updating Bio and Image only

    newImage = params[:user][:profile_image]

    @user.update( bio: params[:user][:bio])
    @user.update( image: newImage ) if newImage != nil
    redirect_to user_path
  end

  def edit 
    #edit page for Bio and Image only
  end

  def destroy
    #deletes user information
    User.find(params[:id]).destroy
    redirect_to users_path
  end

  def show
  #show user profile 
    @last_three = [@user.listings[-1],@user.listings[-2],@user.listings[-3]]
    # @excerpt = @user.listings.body.split(" ")[0..50].join(" ")
    # if @user.listings.body.length > @excerpt
    #   @excerpt
    # end
  end

  def listings
    @all_listings = @user.listings
    # if @user.listings.body > @excerpt 
    #   @excerpt
    # end
  end

  def given_address
    # [street, city, state, country].compact.join(', ')
    # given_address = @user.address.latitude,
  end

  def excerpt
    @excerpt = @user.listings[0..100] + "..."
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def authorize_user
    if @user.id != current_user.id
      redirect_to dash_path
    end
  end

end
