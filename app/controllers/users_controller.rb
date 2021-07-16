class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @record = Record.new
    @records = Record.where(user_id: params[:id]).order('input_day DESC')
    @message = Message.new
    @messages = Message.where(user_id: params[:id]).order("created_at DESC")
    @target = Target.find_by(user_id: params[:id])
    @current_record = Record.where(user_id: params[:id]).limit(1).order('input_day DESC').last
    @reservation = Reservation.new
    @reserved = Reservation.where(user_id: params[:id]).limit(1).order('created_at DESC').last
  end
  
end
