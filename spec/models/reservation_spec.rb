require 'rails_helper'

RSpec.describe Reservation, type: :model do
  before do
    @reservation = FactoryBot.build(:reservation)
  end

  describe 'reservation登録' do
    context '登録できるとき' do
      it '全てがの情報が入力されていれば登録できる' do
        expect(@reservation).to be_valid
      end
    end
    context '登録できないとき' do
      it 'reservation_dayが空では登録できない' do
        @reservation.reservation_day = ''
        @reservation.valid?
        expect(@reservation.errors.full_messages).to include("Reservation dayを入力してください")
      end
      it 'reservation_timeが空では登録できない' do
        @reservation.reservation_time = ''
        @reservation.valid?
        expect(@reservation.errors.full_messages).to include("Reservation timeを入力してください")
      end
      it 'userが紐付いていなければ登録できない' do
        @reservation.user = nil
        @reservation.valid?
        expect(@reservation.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
