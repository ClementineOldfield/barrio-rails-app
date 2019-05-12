class NotificationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_notifications, only: [:index, :set_notifications_as_read]
  after_action :set_notifications_as_read, only: :index

  def index; end
  
  def set_notifications
    @notifications = current_user.notifications.all
    @unread = @notifications.where(read: false)
    @read = @notifications.where(read: true)
  end  

  def set_notifications_as_read
    @notifications.each do |notification|
      notification.update(read: true)
    end
  end

end