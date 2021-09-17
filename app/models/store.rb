class Store < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :image

  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to :prefecture
  # belongs_to :rouryu
  # belongs_to :outside_bath
  # belongs_to :sauna_temp
  # belongs_to :water_temp

  with_options presence: true do
    validates :store_name, length: { maximum: 30 }
    validates :description, length: { maximum: 130 }
    validates :address
    VALID_PHONE_CODE_REGIX = /\A\d{10}$|^\d{11}\z/
    validates :phone_number, format: { with: VALID_PHONE_CODE_REGIX }
    validates :bathing_fee, numericality: { only_integer: true }
    validates :image
  end
end
