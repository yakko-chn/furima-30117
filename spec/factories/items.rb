FactoryBot.define do
  factory :item do
    name                 { 'pan' }
    text                 { 'delicious' }
    category_id          { '5' }
    item_status_id       { '4' }
    delivery_charge_id   { '2' }
    prefecture_id        { '29' }
    shopping_day_id      { '3' }
    price                { '10000' }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

