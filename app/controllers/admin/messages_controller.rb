class Admin::MessagesController < ApplicationController
  
  def index
    @users = User.all
    @user = User.find(params[:room_id])
    @room = Room.find(params[:room_id])
    @room_id = @room.id
    @message = Message.new
    @messages = Message.where(room_id: @room_id).order("created_at DESC")
    @reserved = Reservation.find_by(user_id: params[:room_id])
  end
  
  def create
    @message = Message.new(message_params)
    @message.save
    redirect_to admin_room_messages_path(@room_id)
  end

  private
  def message_params
    @room = Room.find(params[:room_id])
    @room_id = @room.id
    params.require(:message).permit(:text,).merge(user_nickname: current_user.nickname, user_id: current_user.id, room_id: @room_id)
  end

end
