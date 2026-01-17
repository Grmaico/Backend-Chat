class MetricsController < ApplicationController
  skip_before_action :authenticate_user

  def index
    total_messages = Message.count
    active_users = User.where('created_at > ?', 30.days.ago).count

    render json: {
      total_messages: total_messages,
      active_users: active_users
    }
  end
end