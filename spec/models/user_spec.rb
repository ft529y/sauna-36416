require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザーが新規登録できる時' do
      it 'nickname,email,password,password_confirmation,last_name,first_name,birthday,is_deletedが存在すれば登録できること' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上12文字以内なら登録できること' do
        @user.password = 'Test12345678'
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationは半角英大文字、半角英小文字、半角数字混合なら登録できること' do
        @user.password = 'A1a1a1'
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
    end

    context 'ユーザー新規登録ができない時' do
      it 'nicknameが空では登録できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "ニックネームを入力してください"
      end
      it 'emailが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Eメールを入力してください"
      end
      it '重複したemailが存在する場合は登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Eメールはすでに存在します'
      end
      it 'emailには@が存在しなければ登録できないこと' do
        @user.email = 'test.co.jp'
        @user.valid?
        expect(@user.errors.full_messages).to include "Eメールは不正な値です"
      end
      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードを入力してください"
      end
      it 'passwordが5文字以下なら登録できないこと' do
        @user.password = 'A1a1a'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは6文字以上で入力してください"
      end
      it 'passwordが13文字以上なら登録できないこと' do
        @user.password = 'A1a1a1a1a1a1aA'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは無効です 6~12字以内で半角の英大文字、英小文字、数字のみを含んでいる必要があります"
      end
      it 'passwordは半角英大文字を含んでいなければ登録できないこと' do
        @user.password = 'a1a1a1'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは無効です 6~12字以内で半角の英大文字、英小文字、数字のみを含んでいる必要があります"
      end
      it 'passwordは半角英小文字を含んでいなければ登録できないこと' do
        @user.password = 'A1A1A1'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは無効です 6~12字以内で半角の英大文字、英小文字、数字のみを含んでいる必要があります"
      end
      it 'passwordは数字を含んでいなければ登録できないこと' do
        @user.password = 'aAaAaA'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは無効です 6~12字以内で半角の英大文字、英小文字、数字のみを含んでいる必要があります"
      end
      it 'passwordは全角英数字混合では登録できないこと' do
        @user.password = '１１１aA1'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは無効です 6~12字以内で半角の英大文字、英小文字、数字のみを含んでいる必要があります"
      end
      it 'passwordとpassword_confirmationの値が一致していないと登録できないこと' do
        @user.password = 'A1a1a1'
        @user.password_confirmation = 'B1b1b1'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
      end
      it 'last_nameが空では登録できないこと' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "苗字を入力してください"
      end
      it 'first_nameが空では登録できないこと' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "名前を入力してください"
      end
      it 'last_nameは全角入力でないと登録できないこと' do
        @user.last_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include "苗字は全角文字を入力して下さい"
      end
      it 'first_nameは全角入力でないと登録できないこと' do
        @user.first_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include "名前は全角文字を入力して下さい"
      end
      it 'birthdayがnilでは登録できないこと' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "誕生日を入力してください"
      end
      it 'is_deletedがnilでは登録できないこと' do
        @user.is_deleted = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "退会判別コードは一覧にありません"
      end
    end
  end
end
