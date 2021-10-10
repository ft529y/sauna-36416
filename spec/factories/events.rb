FactoryBot.define do
  factory :event do
    execution_id       { 2 }
    place              {'Mt,サウナ'}
    fee                {'1000'}
    start_time         {'2022-01-01 09:00:00'}
    association :user
  end
end
