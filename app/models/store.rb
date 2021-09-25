class Store < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :rouryu
  belongs_to :outside_bath
  belongs_to :break_space

  with_options presence: true do
    VALID_PHONE_CODE_REGIX = /\A[0-9-]+\z/

    validates :store_name, length: { maximum: 30 }
    validates :description, length: { maximum: 130 }
    validates :address
    validates :phone_number, length: { maximum: 15 }, format: { with: VALID_PHONE_CODE_REGIX }
    validates :sauna_temp, length: { maximum: 3 }, numericality: { only_integer: true }
    validates :water_temp, length: { maximum: 3 }, numericality: { only_integer: true }
    validates :bathing_fee, numericality: { only_integer: true }
    validates :image
  end

  with_options numericality: { other_than: 1, message: 'の項目は---以外を入力して下さい' } do
    validates :prefecture_id
    validates :rouryu_id
    validates :outside_bath_id
    validates :break_space_id
  end
end
