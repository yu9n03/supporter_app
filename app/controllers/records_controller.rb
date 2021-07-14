class RecordsController < ApplicationController
  before_action :set_record, only: [:edit, :update, :destroy]
  before_action :user_confirmation, only: [:edit, :update, :destroy]
  before_action :set_contents, only: :create

  def create
    @record = Record.new(record_params)
    @record.save
    redirect_to root_path
    # エラーハンドリングを実装したい
  end

  def edit
    @records = Record.where(user_id: current_user.id).order('input_day DESC')
  end

  def update
    if @record.update(record_params)
      redirect_to action: :index
    else
      @records = Record.where(user_id: current_user.id).order('input_day DESC')
      render :edit
    end
  end

  def destroy
    if @record.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
  def record_params
    params.require(:record).permit(:weight, :body_fat, :memo, :assessment, :input_day).merge(user_id: current_user.id)
  end

  def set_record
    @record = Record.find(params[:id])
  end

  def set_contents
    @records = Record.where(user_id: current_user.id).order('input_day DESC')
    @user = User.find(current_user.id)
    @current_record = Record.where(user_id: current_user.id).limit(1).order('input_day DESC').last
    @target = Target.find_by(user_id: current_user.id)
    @messages = Message.where(user_id: current_user.id).or(Message.where(user_id:1)).order("created_at DESC")
  end

  def user_confirmation
    redirect_to root_path unless current_user.id == @record.user_id
  end
end
