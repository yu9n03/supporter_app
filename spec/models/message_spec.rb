require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end

  describe 'message登録' do
    context '登録できるとき' do
      it '全てがの情報が入力されていれば登録できる' do
        expect(@message).to be_valid
      end
    end
    context '登録できないとき' do
      it 'textが空では登録できない' do
        @message.text = ''
        @message.valid?
        expect(@message.errors.full_messages).to include('Textを入力してください')
      end
      it 'user_nickameが空では登録できない' do
        @message.user_nickname = ''
        @message.valid?
        expect(@message.errors.full_messages).to include('User nicknameを入力してください')
      end
      it 'room_idが空では登録できない' do
        @message.room_id = ''
        @message.valid?
        expect(@message.errors.full_messages).to include('Roomを入力してください')
      end
      it 'ユーザーが紐付いていなければ出品できない' do
        @message.user = nil
        @message.valid?
        expect(@message.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
