require 'rails_helper'

RSpec.describe Record, type: :model do
  before do
    @record = FactoryBot.build(:record)
  end

  describe 'record登録' do
    context '登録できるとき' do
      it '全てがの情報が入力されていれば登録できる' do
        expect(@record).to be_valid
      end
      it 'body_fatは空でも登録できる' do
        @record.body_fat = ''
        expect(@record).to be_valid
      end
      it 'memoは空でも登録できる' do
        @record.memo = ''
        expect(@record).to be_valid
      end
      it 'weigtは小数点なしの3桁でも登録できる' do
        @record.weight = 111
        expect(@record).to be_valid
      end
      it 'weigtは小数点なしの2桁でも登録できる' do
        @record.weight = 99
        expect(@record).to be_valid
      end
      it 'weigtは小数点以下1桁でも登録できる' do
        @record.weight = 99.9
        expect(@record).to be_valid
      end
      it 'weigtは小数点以下2桁でも登録できる' do
        @record.weight = 99.99
        expect(@record).to be_valid
      end
    end
    context '登録できないとき' do
      it 'weightが空では登録できない' do
        @record.weight = ''
        @record.valid?
        expect(@record.errors.full_messages).to include('Weightを入力してください')
      end
      it 'weightが1桁では登録できない' do
        @record.weight = 1
        @record.valid?
        expect(@record.errors.full_messages).to include('Weightは不正な値です')
      end
      it 'weightが4桁以上では登録できない' do
        @record.weight = 1111
        @record.valid?
        expect(@record.errors.full_messages).to include('Weightは不正な値です')
      end
      it 'input_dayが空では登録できない' do
        @record.input_day = ''
        @record.valid?
        expect(@record.errors.full_messages).to include('Input dayを入力してください')
      end
      it 'assessmentが空では登録できない' do
        @record.assessment = ''
        @record.valid?
        expect(@record.errors.full_messages).to include('Assessmentを入力してください')
      end
      it 'ユーザーが紐付いていなければ出品できない' do
        @record.user = nil
        @record.valid?
        expect(@record.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
