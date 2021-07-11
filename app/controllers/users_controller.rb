class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    unless current_user.id == @user.id
      redirect_to root_path
    end
  end
end
