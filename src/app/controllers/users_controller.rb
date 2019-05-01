class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def create

  end

  def update 
    #updating (PATCH) Bio and Image only

  end

  def edit 
    #edit page for Bio and Image only

  end

  def destroy
    #deletes user information
    User.find(params[:id]).destroy
    redirect_to users_url
  end

  def show
  #show user profile 
    
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
