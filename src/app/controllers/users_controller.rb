class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]
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
    
  end

  def given_address
    # [street, city, state, country].compact.join(', ')
    given_address = @user.address.latitude,
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
