class Rouryu < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '有 (30分に1回)' },
    { id: 3, name: '有 (60分に1回)' },
    { id: 4, name: '有 (90分に1回)' },
    { id: 5, name: '有 (120分に1回)' },
    { id: 6, name: '有 (不定期実施)' },
    { id: 7, name: '無' }
  ]

  include ActiveHash::Associations
  has_many :stores
end
