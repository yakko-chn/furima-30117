class OrderAddressForm
  include ActiveModel::Model
  # orders_controllerのparamsで取得するものと同じもの
  attr_accessor :user_id, :item_id, :post_number, :prefecture_id, :city, :address, :building, :phone_number, :token

  with_options presence: true do
    validates  :post_number, format: { with: /\A\d{3}-\d{4}\z/.freeze }
    validates  :city
    validates  :address
    validates  :phone_number, format: { with: /\A\d{10,11}\z/.freeze }
    validates  :token
  end

  with_options numericality: { other_than: 0 }, presence: true do
    validates  :prefecture_id
  end

  def save
    # 各テーブルにデータを保存する処理を書く
    order = Order.create(user_id: user_id, item_id: item_id)
    # 20行目でorderの情報が生成される。その後、DeliveryAddressテーブルに必要な「order.id」を取得できる。
    DeliveryAddress.create(post_number: post_number, prefecture_id: prefecture_id, city: city, address: address,
                           building: building, phone_number: phone_number, order_id: order.id)
  end
end
