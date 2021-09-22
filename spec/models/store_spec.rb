require 'rails_helper'

RSpec.describe Store, type: :model do
  before do
    user = FactoryBot.create(:user)
    @store = FactoryBot.build(:store, user_id: user.id)
  end

  describe '施設情報投稿機能' do
    context '投稿ができる時' do
      it 'store_name,description,sauna_temp,water_temp,rouryu_id,outside_bath_id,break_space_id,bathing_fee,prefecture_id,address,phone_numberが存在すれば投稿できること' do
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
      it 'sauna_tempは3文字以内なら投稿できること' do
        @store.sauna_temp = '50'
        expect(@store).to be_valid
      end
      it 'water_tempは3文字以内なら投稿できること' do
        @store.water_temp = '50'
        expect(@store).to be_valid
      end
      it 'phone_numberは15文字以内なら投稿できること' do
        @store.phone_number = '0120-1234-5678'
      end
      it 'bathing_feeは数値のみだと投稿できること' do
        @store.bathing_fee = '500'
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
      it 'addressが空では投稿できないこと' do
        @store.address = ''
        @store.valid?
        expect(@store.errors.full_messages).to include '住所を入力してください'
      end
      it 'sauna_tempが空では投稿できないこと' do
        @store.sauna_temp = ''
        @store.valid?
        expect(@store.errors.full_messages).to include 'サウナ室温度を入力してください'
      end
      it 'water_tempが空では投稿できないこと' do
        @store.water_temp = ''
        @store.valid?
        expect(@store.errors.full_messages).to include '水風呂温度を入力してください'
      end
      it 'phone_numberが空では投稿できないこと' do
        @store.phone_number = ''
        @store.valid?
        expect(@store.errors.full_messages).to include '電話番号を入力してください'
      end
      it 'bathing_feeが空では投稿できないこと' do
        @store.bathing_fee = ''
        @store.valid?
        expect(@store.errors.full_messages).to include '入浴料を入力してください'
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
      it 'sauna_tempが4文字以上では投稿できないこと' do
        @store.sauna_temp = '1000'
        @store.valid?
        expect(@store.errors.full_messages).to include 'サウナ室温度は3文字以内で入力してください'
      end
      it 'water_tempが4文字以上では投稿できないこと' do
        @store.water_temp = '1000'
        @store.valid?
        expect(@store.errors.full_messages).to include '水風呂温度は3文字以内で入力してください'
      end
      it 'phone_numberが半角数字以外では投稿できないこと' do
        @store.phone_number = '０８０ー１２３４−５６７８'
        @store.valid?
        expect(@store.errors.full_messages).to include '電話番号は不正な値です'
      end
      it 'phone_numberが英数字混合の場合投稿できないこと' do
        @store.phone_number = 'abcd-1234'
        @store.valid?
        expect(@store.errors.full_messages).to include '電話番号は不正な値です'
      end
      it 'phone_numberが15文字以上では投稿できないこと' do
        @store.phone_number = '0120-0123-456789'
        @store.valid?
        expect(@store.errors.full_messages).to include '電話番号は15文字以内で入力してください'
      end
      it 'bathing_feeが数値以外では投稿できないこと' do
        @store.bathing_fee = '千円'
        @store.valid?
        expect(@store.errors.full_messages).to include '入浴料は数値で入力してください'
      end
      it 'prefecture_idが1だと投稿できないこと' do
        @store.prefecture_id = 1
        @store.valid?
        expect(@store.errors.full_messages).to include '都道府県の項目は---以外を入力して下さい'
      end
      it 'rouryu_idが1だと投稿できないこと' do
        @store.rouryu_id = 1
        @store.valid?
        expect(@store.errors.full_messages).to include 'ロウリュ有無の項目は---以外を入力して下さい'
      end
      it 'outside_bath_idが1だと投稿できないこと' do
        @store.outside_bath_id = 1
        @store.valid?
        expect(@store.errors.full_messages).to include '外気浴有無の項目は---以外を入力して下さい'
      end
      it 'break_space_idが1だと投稿できないこと' do
        @store.break_space_id = 1
        @store.valid?
        expect(@store.errors.full_messages).to include '休憩スペース有無の項目は---以外を入力して下さい'
      end
      it '' do
      end
      it 'user_idが空では投稿できないこと' do
        @store.user_id = nil
        @store.valid?
        expect(@store.errors.full_messages).to include 'Userを入力してください'
      end
    end
  end
end
