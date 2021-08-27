class Store < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :image



  with_options presence: true do
    validates :store_name, length: { maximum: 30 }
    validates :description, length: { maximum: 130 }
    validates :image
  end
end
