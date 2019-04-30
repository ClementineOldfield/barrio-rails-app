class UsersController < ApplicationController
  before_action :authenticate_user!

  # def create
  # #create new user
  # # @user = User.create(listing_params)
  # user = User.create(
  #   first_name: params.first_name,
  #   last_name: params.last_name,
  #   bio: params.bio,
  #   email: params.email,
  #   encrypted_password: params.password
  # )
  # redirect_to user_path
  # end

  def update 
  #update user information
  end

  def edit 
  #show the edit form
  end

  def destroy
  #deletes user information
  end

  def show 
  #show user profile
    @user = User.find(params[:id])
  end


  
end
