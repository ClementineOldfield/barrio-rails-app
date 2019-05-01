class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

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
  # def update 
  # #update user information
  # @user = User.create(
  #   first_name: params.first_name,
  #   last_name: params.last_name,
  #   bio: params.bio,
  #   email: params.email,
  #   encrypted_password: params.password,
  # )
  # redirect_to user_path
  # end

  def update
    @user.bio = params[:bio]
    @user.image.url = params[:image].url
    redirect_to user_path
  end

  def edit 
  #show the edit form
  end

  def destroy
  #deletes user information
  User.find(params[:id]).destroy
  redirect_to users_url
  end

# GET /users/:id
  def show
  #show user profile
    
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
