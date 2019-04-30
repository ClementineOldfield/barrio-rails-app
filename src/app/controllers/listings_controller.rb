class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end
  def create; end
  def show; end
  def edit; end
  def new; end
  def update; end
  def destroy; end
end
