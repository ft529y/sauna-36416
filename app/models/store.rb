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
  
  validates :prefecture_id, inclusion: { in: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47], message: 'の項目は---以外を入力して下さい' }
  
  with_options numericality: { other_than: 1, message: 'の項目は---以外を入力して下さい' } do
    validates :rouryu_id
    validates :outside_bath_id
    validates :break_space_id
  end
  
end
