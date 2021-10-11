class Execution < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '予定' },
    { id: 3, name: '予定外' }
  ]

  include ActiveHash::Associations
  has_many :events
end
