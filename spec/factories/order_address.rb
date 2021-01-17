FactoryBot.define do
  factory :order_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '990-0000' }
    prefecture_id { 2 }
    city { '釧路市' }
    address { '釧路１' }
    telephone_number { '090-1234-5678' }
    item_id { 1 }
    user_id { 1 }
  end
end
