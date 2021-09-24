require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    user = FactoryBot.create(:user)
    store = FactoryBot.create(:store)
    @comment = FactoryBot.build(:comment, user_id: user.id, store_id: store.id)
  end

  describe 'コメント投稿機能' do
    context 'コメント投稿できる時' do
      it 'text,evaluationが存在すればコメント登録できること' do
        expect(@comment).to be_valid
      end
    end
    context 'コメント投稿できない時' do
      it '文章が存在しなければコメント登録できないこと' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include('文章を入力してください')
      end
      it 'evaluationが0では登録できないこと' do
        @comment.evaluation = 0
        @comment.valid?
        expect(@comment.errors.full_messages).to include '評価を入力して下さい。'
      end
      it 'user_idが空では投稿できないこと' do
        @comment.user_id = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include 'Userを入力してください'
      end
      it 'store_idが空では投稿できないこと' do
        @comment.store_id = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include 'Storeを入力してください'
      end
    end
  end
end
