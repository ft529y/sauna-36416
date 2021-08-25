class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_many :stores



   with_options presence: true do
    validates :nickname
    validates :birthday
    VALID_NAME_REGIX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
    with_options format: { with: VALID_NAME_REGIX, message: 'is invalid. Input full-width characters' } do
      validates :last_name
      validates :first_name
    end
   end

   VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,12}\z/
   validates :password,
   format: { with: VALID_PASSWORD_REGEX, message: ' is invalid. Include uppercaseletters and lowercaseletters and numbers' }
end
