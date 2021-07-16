class Admin::MessagesController < ApplicationController
  def create
    message = Message.new(message_params)
    if message.save
       render json: {message: message}
    else
      flash.now[:alert]
    end
  end

  private
  def message_params
    params.require(:message).permit(:text, :room_id).merge(user_nickname: current_user.nickname, user_id: current_user.id)
  end
end
