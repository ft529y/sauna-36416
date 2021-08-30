FactoryBot.define do
  factory :comment do
    text          {'とてもおすすめです。'}
    association :user
    association :store
  end
end
