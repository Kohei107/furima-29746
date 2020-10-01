FactoryBot.define do
  factory :item do
    name                 { '名前' }
    detail               { '商品説明' }
    category_id          { 2 }
    condition_id         { 5}
    shipping_fee_id      {1}
    shipping_place_id    {40}
    prep_time_id         {2}
    price                {1_000_000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
