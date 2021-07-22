require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全てがの情報が入力されていれば登録できる' do
        expect(@user).to be_valid
      end
      it 'heightは小数点なしの3桁でも登録できる' do
        @user.height = 180
        expect(@user).to be_valid
      end
      it 'basis_weigtは小数点なしの3桁でも登録できる' do
        @user.basis_weight = 100
        expect(@user).to be_valid
      end
      it 'basis_weigtは小数点なしの2桁でも登録できる' do
        @user.basis_weight = 99
        expect(@user).to be_valid
      end
      it 'basis_weigtは小数点以下1桁でも登録できる' do
        @user.basis_weight = 99.9
        expect(@user).to be_valid
      end
      it 'basis_weigtは小数点以下2桁でも登録できる' do
        @user.basis_weight = '99.99'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Nicknameを入力してください')
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'emailには@を含まないと登録できない' do
        @user.email = 'sample123456.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'a1a1a'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password = 'a1a1a1'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'ageが空では登録できない' do
        @user.age = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Ageを入力してください')
      end
      it 'ageが1桁では登録できない' do
        @user.age = 1
        @user.valid?
        expect(@user.errors.full_messages).to include('Ageは不正な値です')
      end
      it 'ageが3桁では登録できない' do
        @user.age = 111
        @user.valid?
        expect(@user.errors.full_messages).to include('Ageは不正な値です')
      end
      it 'ageが全角数字2桁では登録できない' do
        @user.age = '１１'
        @user.valid?
        expect(@user.errors.full_messages).to include('Ageは不正な値です')
      end
      it 'heightが空では登録できない' do
        @user.height = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Heightを入力してください')
      end
      it 'heightが2桁以下では登録できない' do
        @user.height = 99
        @user.valid?
        expect(@user.errors.full_messages).to include('Heightは不正な値です')
      end
      it 'heightが4桁以上では登録できない' do
        @user.height = 1111
        @user.valid?
        expect(@user.errors.full_messages).to include('Heightは不正な値です')
      end
      it 'basis_weightが空では登録できない' do
        @user.basis_weight = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Basis weightを入力してください')
      end
      it 'basis_weightが1桁では登録できない' do
        @user.basis_weight = 1
        @user.valid?
        expect(@user.errors.full_messages).to include('Basis weightは不正な値です')
      end
      it 'basis_weightが4桁以上では登録できない' do
        @user.basis_weight = 1111
        @user.valid?
        expect(@user.errors.full_messages).to include('Basis weightは不正な値です')
      end
    end
  end
end
