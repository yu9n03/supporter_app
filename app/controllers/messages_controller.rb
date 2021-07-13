class MessagesController < ApplicationController
  
  def create
    @message = Message.new(message_params)
    @message.save
  end

  private
  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id)
  end
end
