class TargetsController < ApplicationController
  def index
    @target = Target.includes(:user)
  end
  
  def new
    @target = Target.new
  end

  def create
    @target = Target.new(target_params)
    if @target.save
      redirect_to 'index'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def target_params
    params.require(:target).permit(:goal_weight, :period_id, :plan).merge(user_id: current_user.id)
  end
end
