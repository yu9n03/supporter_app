class MessagesController < ApplicationController
  
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
    if current_user.admin?
      params.require(:message).permit(:text,).merge(user_nickname: current_user.nickname, user_id: current_user.id, room_id: @room_id)
    else
      params.require(:message).permit(:text).merge(user_nickname: current_user.nickname, user_id: current_user.id, room_id: current_user.id)
    end
  end

end
