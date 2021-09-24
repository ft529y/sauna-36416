FactoryBot.define do
  factory :store do
    store_name            { 'サウナ' }
    description           { 'サウナはとても気持ちいいです。' }
    sauna_temp            {'100'}
    water_temp            {'15'}
    rouryu_id             {2}
    outside_bath_id       {2}
    break_space_id        {2}
    bathing_fee           {'1000'}
    prefecture_id         {2}
    address               {'東京都港区青山1-1-1サンプルビル100'}
    phone_number          {'09012345678'}
    association :user

    after(:build) do |store|
      store.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
