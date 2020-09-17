FactoryBot.define do
  factory :information_address do
    postal_code     {'111-1111'}
    prefecture_id   {3}
    city_name       {'あああああ'}
    block_number    {'3333'}
    buildding_name  {'あああ'}
    phone_number    {'1234121234'}
    token           {"tok_dslj34kdla"}
    association :user
    association :item

  end
end
