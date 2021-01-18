FactoryBot.define do
  factory :order_address do
    association :item
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '990-0000' }
    prefecture_id { 2 }
    city { '釧路市' }
    address { '釧路１' }
    building_name { '釧路ビル' }
    telephone_number { '09012345678' }
  end
end
