class Admin::UsersController < ApplicationController
  before_action :if_not_admin
  before_action :set_user, only: [:show, :destroy]
  
  def index
    @users = User.all
  end

  def show
  end

  def destroy
  end
  
  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  def set_user
    @user = User.find(params[:id])
  end
end
