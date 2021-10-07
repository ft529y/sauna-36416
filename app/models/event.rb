class Event < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :execution
  
  validates :execution_id, numericality: { other_than: 1, message: 'の項目は---以外を入力して下さい' }
end
