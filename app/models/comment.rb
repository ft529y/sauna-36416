class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :store

  validates :text,       presence: true
  validates :evaluation, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 0.5, message: 'を入力して下さい。'
  }
end
