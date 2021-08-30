require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    user = FactoryBot.create(:user)
    store = FactoryBot.create(:store)
    @comment = FactoryBot.build(:comment, user_id: user.id, store_id: store.id)
  end

  describe 'コメント投稿機能' do
    context 'コメント投稿できる時' do
      it 'textが存在すればコメント登録できること' do
        expect(@comment).to be_valid
      end
    end
    context 'コメント投稿できない時' do
      it '文章が存在しなければコメント登録できないこと' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("文章を入力してください")
      end
    end
  end
end
