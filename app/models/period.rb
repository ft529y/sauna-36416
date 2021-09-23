class Period < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '初心者' },
    { id: 4, name: '半年' },
    { id: 5, name: '1年' },
    { id: 6, name: '3年以上' },
    { id: 7, name: '5年以上' },
  ]

  include ActiveHash::Associations
  has_many :users
end