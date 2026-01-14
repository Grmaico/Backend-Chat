class MessagesController < ApplicationController
  def create
    receiver = User.find_by(email: params[:receiver_email])

    message = Message.create!(
      sender: @current_user,
      receiver: receiver,
      content: params[:content]
    )

    render json: message
  end

  def index
    messages = Message.where(
      sender: @current_user
    ).or(
      Message.where(receiver: @current_user)
    )

    render json: messages
  end
end