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

  end

  def show 
    
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
