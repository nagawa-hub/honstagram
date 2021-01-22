class NotificationsController < ApplicationController
  before_action :set_search, only: [:index]
  
  def index
    @notifications = current_user.passive_notifications.page(params[:page]).per(10)
    @notifications.where(checked: false).map do |notification|
      notification.update_attributes(checked: true)
    end
  end

  private
  def set_search
    @q = Book.ransack(params[:q]) 
  end
end
