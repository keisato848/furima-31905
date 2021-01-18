FactoryBot.define do
  factory :item do
    association :user
    name { 'テスト商品' }
    explanation { 'テストです。テストです。テストです。テストです。テストです。テストです。テストです。' }
    item_fee { 50_000 }
    category_id { 2 }
    state_id { 2 }
    prefecture_id { 2 }
    shipping_fee_burden_id { 2 }
    delivery_day_id { 2 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.jpg'), filename: 'test.jpg')
    end
  end
end
