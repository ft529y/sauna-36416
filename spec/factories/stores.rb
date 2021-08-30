FactoryBot.define do
  factory :store do
    store_name            {'サウナ'}
    description           {'サウナはとても気持ちいいです。'}
    association :user

    after(:build) do |store|
      store.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
