require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全てがの情報が入力されていれば登録できる' do

      end
      it 'passwordとpassword_confirmationは6文字以上の半角英数混合の入力であれば登録できる' do

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
      it 'passwordが半角数字のみでは登録できない' do

      end
      it 'passwordは半角英字のみでは登録できない' do

      end
      it 'passwordは全角英数字では登録できない' do

      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do

      end

      it 'nicknameが空では登録できない' do

      end
      it 'ageが空では登録できない' do

      end
      it 'heightが空では登録できない' do

      end
      it 'basis_weightが空では登録できない' do

      end
    end
  end
end
