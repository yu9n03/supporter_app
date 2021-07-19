class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :create_room
  before_action :contributor_confirmation

  def show
    @user = User.find(params[:id])
    @record = Record.new
    @records = Record.where(user_id: params[:id]).order('input_day DESC')
    @message = Message.new
    @messages = Message.where(room_id: params[:id]).order("created_at DESC")
    @target = Target.find_by(user_id: params[:id])
    @current_record = Record.where(user_id: params[:id]).limit(1).order('input_day DESC').last
    @today = Date.today
    @reservation = Reservation.new
    @reserved = Reservation.where(user_id: params[:id]).limit(1).order('created_at DESC').last
    
    if @target.present?
      count_day
    end
  end

  private
  def count_day
    @target = Target.find_by(user_id: params[:id])
    @period = @target.period_id
    @start_day = @target.created_at
    @last_day = @start_day.since(@period.month)
    @today = Time.now
    
    @remaining_second = (@last_day - @today).to_i
    @remaining_day = ((@last_day - @today)/ 1.days).floor
  end

  def create_room
    @room = Room.find_by(user_id: params[:id])
    if @room.nil?
    @room = Room.create(user_id: params[:id])
    end
  end

  def contributor_confirmation
    @user = User.find(params[:id])
    redirect_to root_path unless current_user == @user || current_user.admin?
  end
end
