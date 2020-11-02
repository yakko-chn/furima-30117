class Order < ApplicationRecord
  attr_accessor :token

  validates :token, presence: true

  # Assocition
  belongs_to :user
  belongs_to :item
  has_one    :delivery_address
end
