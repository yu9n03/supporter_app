require 'rails_helper'

RSpec.describe Target, type: :model do
  before do
    @target = FactoryBot.build(:target)
  end

  describe '新規目標の設定' do
    context '目標の登録ができる場合' do
      it '全ての項目が入力されていれば出品できる' do
      end
    end
    context '目標の登録ができない場合' do
      it 'goal_weightが空では登録できない' do
      end
      it 'goal_weightが1桁では登録できない' do
      end
      it 'goal_weightが4桁以上では登録できない' do
      end
      it 'period_idが空では登録できない' do
      end
      it 'period_idが1では登録できない' do
      end
      it 'planが空では登録できない' do
      end
      it 'planが空では登録できない' do
      end
      it 'ユーザーが紐付いていなければ出品できない' do
      end
    end
  end

end
