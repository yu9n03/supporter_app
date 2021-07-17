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
    if message.save
       render json: {message: message}
    else
      flash.now[:alert]
    end
  end

  private

end
