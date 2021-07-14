class TargetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :new, :edit]
  
  def show
    unless current_user.id == @user.id
      redirect_to root_path
    end
  end

  def new
    @target = Target.new
  end

  def create
    @target = Target.new(target_params)
    if @target.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @target = Target.find(params[:id])
  end

  def update
    @target = Target.find(params[:id])
    if @target.update(target_params)
      redirect_to root_path
    else 
      render :edit
    end
  end

  private

  def target_params
    params.require(:target).permit(:goal_weight, :period_id, :plan).merge(user_id: current_user.id)
  end

  def set_user
    @user = User.find(current_user.id)
  end
end
