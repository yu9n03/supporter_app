class Admin::UsersController < ApplicationController
  before_action :if_not_admin
  before_action :set_user, only: [:show, :destroy]
  
  def index
    @users = User.all
    @message = Message.new
    @messages = Message.where(user_id: params[:id]).order("created_at DESC")
  end

  def show
    @record = Record.new
    @records = Record.where(user_id: params[:id]).order('input_day DESC')
    @message = Message.new
    @messages = Message.where(room_id: params[:id]).order("created_at DESC")
    @target = Target.find_by(user_id: params[:id])
    @current_record = Record.where(user_id: params[:id]).limit(1).order('input_day DESC').last
    @reserved = Reservation.where(user_id: params[:id]).limit(1).order('created_at DESC').last
    if @target.present?
      count_day
    end
  end

  def destroy
  end
  
  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  def set_user
    @user = User.find(params[:id])
  end

  def count_day
    @target = Target.find_by(user_id: params[:id])
    @period = @target.period_id
    @start_day = @target.created_at
    @last_day = @start_day.since(@period.month)
    @today = Time.now
    
    @remaining_second = (@last_day - @today).to_i
    @remaining_day = ((@last_day - @today)/ 1.days).floor
  end
end
