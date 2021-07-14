class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @record = Record.new
    @records = Record.where(user_id: current_user.id).order('input_day DESC')
    @user = User.find(current_user.id)
    @current_record = Record.where(user_id: current_user.id).limit(1).order('input_day DESC').last
    @target = Target.find_by(user_id: current_user.id)
    @message = Message.new
    @messages = Message.all.order("created_at DESC")
    binding.pry
  end
end
