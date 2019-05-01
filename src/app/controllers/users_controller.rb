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

  # PUT /users/:id
  def update 
  # #update user information
  # @user = User.create(
  #   first_name: params.first_name,
  #   last_name: params.last_name,
  #   bio: params.bio,
  #   email: params.email,
  #   encrypted_password: params.password,
  # )
  # redirect_to user_path
  end

  def edit 
  #show the edit form
    @user = User.find(params[:id])
  end

  def destroy
  #deletes user information
  end

# GET /users/:id
  def show 
  #show user profile
    @user = User.find(params[:id])
  end

end
