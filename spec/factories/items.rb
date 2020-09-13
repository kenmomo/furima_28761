FactoryBot.define do
  factory :item do
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    item_name               { 'aaaa' }
    content                 { 'aaaaaaaaaaaa' }
    category_id { '4' }
    condition_id { '3' }
    price { '2000' }
    delivery_burden_id { '3' }
    delivery_area_id    { '5' }
    delivery_days_id    { '4' }
  end
end
