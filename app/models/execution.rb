class Execution < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '◯' },
    { id: 3, name: '予定' }
  ]

  include ActiveHash::Associations
  has_many :events
end
