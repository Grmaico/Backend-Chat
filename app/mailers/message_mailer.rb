class MessageMailer < ApplicationMailer
  def new_message(message)
    @message = message
    @sender = message.sender
    @receiver = message.receiver

    mail(
      to: @receiver.email,
      subject: "Nova mensagem de #{@sender.email}"
    )
  end
end