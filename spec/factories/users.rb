FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { 'Test1111' }
    password_confirmation { password }
    last_name             { Faker::Name.last_name }
    first_name            { Faker::Name.first_name }
    birthday              { '2000-01-01' }
    is_deleted            { 0 }
    my_area               {'東京都港区'}
    period_id             { 2 }
    introduce             {Faker::Lorem.sentence}
  end
end
