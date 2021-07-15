class ReservationsController < ApplicationController
  before_action :set_user

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
       redirect_to mypage_path(@user)
    else
      flash.now[:alert]
    end
  end

  def destroy
    @reserved = Reservation.where(user_id: params[:id]).limit(1).order('created_at DESC').last
    @reservation = Reservation.find(params[:id])
    if @reservation.destroy
      redirect_to mypage_path(@user)
    else
      redirect_to mypage_path(@user)
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:reservation_day, :reservation_time).merge(user_id: current_user.id)
  end

  def set_user
    @user = User.find(current_user.id)
  end

end
