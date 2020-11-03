FactoryBot.define do
  factory :order_address_form do
    post_number              { '000-0000' }
    prefecture_id            { '5' }
    city                     { '横浜市' }
    address                  { '1-1' }
    building                 { '東海ビル3F'}
    phone_number             { '00000000000' }
    token { 'tok_abcdefghijk00000000000000000' }

    association :user
    association :item
  end
end
