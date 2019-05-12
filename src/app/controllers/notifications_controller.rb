class NotificationsController < ApplicationController
    before_action :set_notifications, if: :user_signed_in?

    def index
        set_notifications
        set_notification_as_read
    end
    
    def set_notifications
            @notifications = current_user.notifications.all
            @unread = @notifications.where(read: false)
            @read = @notifications.where(read: true)
    end  

    def set_notification_as_read
        notifications.each  do |notification|
          notification.update(read: true)
        end
    end

end