require 'rails_helper'

RSpec.describe Store, type: :model do
  before do
    user = FactoryBot.create(:user)
    @store = FactoryBot.build(:store, user_id: user.id)
  end

  describe '施設情報投稿機能' do
    context '投稿ができる時' do
      it 'store_name,descriptionが存在すれば投稿できること' do
        expect(@store).to be_valid
      end
      it 'store_nameは30文字以内なら投稿できること' do
        @store.store_name = 'あ' * 30
        expect(@store).to be_valid
      end
      it 'descriptionは130文字以内なら投稿できること' do
        @store.description = 'あ' * 130
        expect(@store).to be_valid
      end
    end

    context '投稿ができない時' do
      it 'store_nameが空では投稿できないこと' do
        @store.store_name = ''
        @store.valid?
        expect(@store.errors.full_messages).to include '施設名を入力してください'
      end
      it 'descriptionが空では投稿できないこと' do
        @store.description = ''
        @store.valid?
        expect(@store.errors.full_messages).to include '紹介文を入力してください'
      end
      it 'imageが空では投稿できないこと' do
        @store.image = nil
        @store.valid?
        expect(@store.errors.full_messages).to include '画像を入力してください'
      end
      it 'store_nameが31文字以上では投稿できないこと' do
        @store.store_name = 'あ' * 31
        @store.valid?
        expect(@store.errors.full_messages).to include '施設名は30文字以内で入力してください'
      end
      it 'descriptionが131文字以上では投稿できないこと' do
        @store.description = 'あ' * 131
        @store.valid?
        expect(@store.errors.full_messages).to include '紹介文は130文字以内で入力してください'
      end
    end
  end
end
