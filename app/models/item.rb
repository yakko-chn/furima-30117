class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shopping_day

  with_options presence: true do
    validates  :image
    validates  :name
    validates  :text
  end

  with_options numericality: { other_than: 1 }, presence: true do
    validates  :category_id
    validates  :item_status_id
    validates  :delivery_charge_id
    validates  :shopping_day_id
  end

  with_options numericality: { other_than: 0 }, presence: true do
    validates  :prefecture_id
  end

  validates  :price, presence: true, format: { with: /\A[0-9]+\z/.freeze }, numericality: { greater_than: 300, less_than: 9_999_999 }

  # Association
  belongs_to :user
  has_one_attached :image
  has_one    :order
end
