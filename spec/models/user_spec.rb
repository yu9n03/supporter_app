require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全てがの情報が入力されていれば登録できる' do

      end
      it 'heigtは小数点なしの3桁でも登録できる' do

      end
      it 'basis_weigtは小数点なしの3桁でも登録できる' do

      end
      it 'basis_weigtは小数点なしの2桁でも登録できる' do

      end
      it 'basis_weigtは小数点以下1桁でも登録できる' do

      end
      it 'basis_weigtは小数点以下2桁でも登録できる' do

      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do

      end
      it 'emailが空では登録できない' do

      end
      it '重複したemailが存在する場合登録できない' do

      end
      it 'emailには@を含まないと登録できない' do

      end
      it 'passwordが空では登録できない' do

      end
      it 'passwordが5文字以下では登録できない' do

      end
      it 'passwordは全角英数字では登録できない' do

      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do

      end
      it 'ageが空では登録できない' do

      end
      it 'ageが1桁では登録できない' do

      end
      it 'ageが3桁では登録できない' do

      end
      it 'ageが全角数字2桁では登録できない' do

      end
      it 'heightが空では登録できない' do

      end
      it 'heightが2桁以下では登録できない' do
      
      end
      it 'heightが4桁以上では登録できない' do

      end
      it 'heightが小数点以下2桁では登録できない' do

      end
      it 'basis_weightが空では登録できない' do

      end
      it 'basis_weightが1桁では登録できない' do
      
      end
      it 'basis_weightが4桁以上では登録できない' do

      end
      it 'basis_weightが小数点以下3桁では登録できない' do

      end
    end
  end
end
