FactoryBot.define do
  factory :order_address do
    postal_code      { '123-4567' }
    prefecture_id    { 1 }
    municipality     { '大阪市' }
    street_number    { '1-1' }
    building         { '大阪ハイツ' }
    phone_number     { '12345678901' }
    token            {'tok_f11111ac11e1a1111a11b1cfa1a1'}
  end
end