class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_record, only: [:edit, :update, :destroy]
  before_action :set_contents, only: :create
  before_action :set_user, only: [:create, :edit, :update, :destroy]

  def create
    @record = Record.new(record_params)
    if @record.save
      redirect_to mypage_path(@user)
    else
      render "users/show"
    end
  end

  def edit
    @records = Record.where(user_id: current_user.id).order('input_day DESC')
  end

  def update
    if @record.update(record_params)
      redirect_to mypage_path(@user)
    else
      @records = Record.where(user_id: current_user.id).order('input_day DESC')
      render :edit
    end
  end

  def destroy
    if @record.destroy
      redirect_to mypage_path(@user)
    else
      redirect_to mypage_path(@user)
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

  def set_user
    @user = User.find(current_user.id)
  end
end
