require 'rails_helper'

RSpec.describe Target, type: :model do
  before do
    @target = FactoryBot.build(:target)
  end

  describe '新規目標の設定' do
    context '目標の登録ができる場合' do
      it '全ての項目が入力されていれば出品できる' do
        expect(@target).to be_valid
      end
    end
    context '目標の登録ができない場合' do
      it 'goal_weightが空では登録できない' do
        @target.goal_weight = ''
        @target.valid?
        expect(@target.errors.full_messages).to include("Goal weightを入力してください")
      end
      it 'goal_weightが1桁では登録できない' do
        @target.goal_weight = 1
        @target.valid?
        expect(@target.errors.full_messages).to include("Goal weightは不正な値です")
      end
      it 'goal_weightが4桁以上では登録できない' do
        @target.goal_weight = 1111
        @target.valid?
        expect(@target.errors.full_messages).to include("Goal weightは不正な値です")
      end
      it 'period_idが空では登録できない' do
        @target.period_id = ''
        @target.valid?
        expect(@target.errors.full_messages).to include("Periodを入力してください")
      end
      it 'period_idが1では登録できない' do
        @target.period_id = 1
        @target.valid?
        expect(@target.errors.full_messages).to include("Periodcan't be blank")
      end
      it 'planが空では登録できない' do
        @target.plan = ''
        @target.valid?
        expect(@target.errors.full_messages).to include("Planを入力してください")
      end
      it 'ユーザーが紐付いていなければ出品できない' do
        @target.user = nil
        @target.valid?
        expect(@target.errors.full_messages).to include("Userを入力してください")
      end
    end
  end

end
