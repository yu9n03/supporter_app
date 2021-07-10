class RecordsController < ApplicationController
  before_action :authenticate_user!

  def index
    @records = Record.where(user_id: current_user.id)
  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    if @record.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def record_params
    params.permit(:weight, :body_fat, :memo, :assessment_id, :input_day).merge(user_id: current_user.id)
  end
end
