class TargetsController < ApplicationController
  before_action :set_target, only: [:show, :edit, :update]
  before_action :contributor_confirmation

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

  def contributor_confirmation
    @target = Target.find(params[:id])
    redirect_to root_path unless current_user == @target.user || current_user.admin?
  end
end
