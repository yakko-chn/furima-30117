class DeliveryAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates  :post_number, format: { with: /\A\d{3}-\d{4}\z/.freeze }
    validates  :city
    validates  :address
    validates  :phone_number, format: { with: /\A\d{10,11}\z/.freeze }
  end

  with_options numericality: { other_than: 0 }, presence: true do
    validates  :prefecture_id
  end

  # Association
  belongs_to :order
end
