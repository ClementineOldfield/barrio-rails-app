class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def create

  end

  def update 
    #updating Bio and Image only

    @user.update(
      bio: params[:user][:bio],
      image: params[:user][:profile_image]
    )
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

  private

  def set_user
    @user = User.find(params[:id])
  end

end
