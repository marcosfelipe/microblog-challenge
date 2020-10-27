class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    notifications = current_user.notifications.order(created_at: :desc)
    render json: notifications.to_json
  end
end
