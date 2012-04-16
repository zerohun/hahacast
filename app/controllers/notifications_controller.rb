class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications.includes(:notifiable).paginate(:page => params[:page]).order('id DESC')
  end
end
