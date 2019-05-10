class MessagesController < ApplicationController
  before_action :set_recipient, only: [:new, :create]

  def new

  end

  def create; end

  def set_recipient
    @recipient = User.find(params[:user])
  end
end
