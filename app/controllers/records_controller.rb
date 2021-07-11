class RecordsController < ApplicationController
  before_action :authenticate_user!

  def index
    @records = Record.where(user_id: current_user.id).limit(10).order('input_day DESC')
    @record = Record.new
    @user = User.find(current_user.id)
  end

  def create
    @record = Record.new(record_params)
    if @record.save
      redirect_to action: :index
    else
      @records = Record.where(user_id: current_user.id).limit(10).order('input_day DESC')
      render :index
    end
  end

  def edit
    @record = Record.find(params[:id])
  end

  def update
    @record = Record.find(params[:id])
    if @record.update(record_params)
      redirect_to action: :index
    else
      render :edit
    end
  end

  def destroy
    @record = Record.find(params[:id])
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
end
