FactoryBot.define do
  factory :order_address_form do
    user_id                  { '16' }
    item_id                  { '18' }
    post_number              { '000-0000' }
    prefecture_id            { '5' }
    city                     { '横浜市' }
    address                  { '1-1' }
    phone_number             { '00000000000' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
