class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_many :stores
   has_many :comments


   with_options presence: true do
    validates :nickname
    validates :birthday
    VALID_NAME_REGIX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
    with_options format: { with: VALID_NAME_REGIX, message: 'は全角文字を入力して下さい' } do
      validates :last_name
      validates :first_name
    end
   end

   VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,12}\z/
   validates :password,
   format: { with: VALID_PASSWORD_REGEX, message: 'は無効です 6~12字以内で半角の英大文字、英小文字、数字のみを含んでいる必要があります' },allow_nil: true

   validates :is_deleted, inclusion: { in: [true, false] }

   def active_for_authentication?
    super && (is_deleted == false)
   end
end
