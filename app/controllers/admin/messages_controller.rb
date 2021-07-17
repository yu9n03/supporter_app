class Admin::MessagesController < ApplicationController
  
  def index
    @users = User.all
    @room = User.find(params[:format])
    @room_id = @room.id
    @message = Message.new
    @messages = Message.where(room_id: @room_id).order("created_at DESC")
  end
  
  def create
    message = Message.new(message_params)
    redirect_to admin_users_path
  end

  private
  def message_params
    params.require(:message).permit(:text,).merge(user_nickname: current_user.nickname, user_id: current_user.id, room_id: @room_id)
  end

end
