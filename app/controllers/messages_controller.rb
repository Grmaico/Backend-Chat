class MessagesController < ApplicationController
  def create
    Rails.logger.info "Params: #{params.inspect}"
    receiver = User.find_by(email: params[:message][:receiver_email])

    if receiver.nil?
      render json: { error: 'Destinatário não encontrado' }, status: :unprocessable_entity
      return
    end

    message = Message.create!(
      sender: @current_user,
      receiver: receiver,
      content: params[:message][:content]
    )

    MessageMailer.new_message(message).deliver_later

    # Broadcast para o destinatário
    ActionCable.server.broadcast("messages_#{receiver.id}", message.as_json(include: [:sender, :receiver]))

    render json: message
  end

  def index
    if params[:user_id].to_i != @current_user.id
      render json: { error: 'Acesso negado' }, status: :forbidden
      return
    end

    messages = Message.where(
      sender: @current_user
    ).or(
      Message.where(receiver: @current_user)
    ).includes(:sender, :receiver).page(params[:page]).per(params[:per_page] || 10)

    render json: messages.as_json(include: [:sender, :receiver])
  end
end