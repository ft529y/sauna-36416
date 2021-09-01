FactoryBot.define do
  factory :comment do
    text          {'とてもおすすめです。'}
    evaluation    {3}
    association :user
    association :store
  end
end
