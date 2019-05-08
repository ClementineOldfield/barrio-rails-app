class PurchasesController < ApplicationController
  def seed_user
    user = User.create(
      first_name: params[:first_name]
      last_name: params[:last_name]
      email: params[:email]
      password: params[:password]
      password_confirmation: params[:password_confirmation]
    )
    return user
  end

end