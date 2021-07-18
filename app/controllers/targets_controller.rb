class TargetsController < ApplicationController
  before_action :set_target, only: [:show, :edit, :update]

  def show
    @user = User.find(current_user.id)
    @target = Target.find(params[:id])
  end

  def new
    @user = User.find(current_user.id)
    @target = Target.new
  end

  def create
    @target = Target.new(target_params)
    if @target.save
      redirect_to target_path(current_user.target)
    else
      render :new
    end
  end

  def edit
    @user = User.find(current_user.id)
    @target = Target.find(params[:id])
  end

  def update
    if @target.update(target_params)
      redirect_to target_path(current_user.target)
    else
      render :edit
    end
  end

  private

  def target_params
    params.require(:target).permit(:goal_weight, :period_id, :plan).merge(user_id: current_user.id)
  end

  def set_target
    @target = Target.find(params[:id])
  end


end
