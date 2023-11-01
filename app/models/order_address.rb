class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :name, :price, :shipping_fee_bearer, :postal_code, :prefecture_id, :city, :house_number, :building_name,
                :telephone_number, :product_id, :user_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :house_number
    validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Exclude hyphen(-)' }
    validates :user_id
    validates :product_id
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    # 購入情報を保存し、変数orderに代入する
    order = Order.create(product_id: product_id, user_id: user_id)
    # 住所を保存する
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number,
                   building_name: building_name, telephone_number: telephone_number, order_id: order.id)
  end
end
