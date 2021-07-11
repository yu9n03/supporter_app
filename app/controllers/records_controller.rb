class RecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_record, only: [:edit, :update, :destroy]
  before_action :set_contents, only: [:index, :create]


  def index
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    if @record.save
      redirect_to action: :index
    else
      render :index
    end
  end

  def edit
  end

  def update
    if @record.update(record_params)
      redirect_to action: :index
    else
      render :edit
    end
  end

  def destroy
    if @record.destroy
      redirect_to action: :index
    else
      redirect_to action: :index
    end
  end

  private
  def record_params
    params.require(:record).permit(:weight, :body_fat, :memo, :assessment_id, :input_day).merge(user_id: current_user.id)
  end

  def set_record
    @record = Record.find(params[:id])
  end

  def set_contents
    @records = Record.where(user_id: current_user.id).limit(10).order('input_day DESC')
    @user = User.find(current_user.id)
    @current_record = Record.where(user_id: current_user.id).limit(1).order('input_day DESC').last
    @target = Target.find_by(user_id: current_user.id)
  end
end
