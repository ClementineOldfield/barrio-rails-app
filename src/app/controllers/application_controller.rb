class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_notifications, if: :user_signed_in?
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :bio])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :bio])
  end

  def set_notifications
    @notifications = current_user.notifications.all
    @unread = @notifications.where(read: false)
    @read = @notifications.where(read: true)
  end  

end