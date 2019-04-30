class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  def index
    @listings = Listing.all
  end
  
  def create; end
  def show; end
  def edit; end
  def new; end
  def update; end
  def destroy; end

  private 

  def set_listing
    @id = params[:id]
    @listing = Listing.find(@id)
  end
end
