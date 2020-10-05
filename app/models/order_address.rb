class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :municipality, :street_number, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Postal code input correctly' }
    validates :municipality
    validates :street_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
  end
  validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }

  def save
    # @item = Item.find(item_id)
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, street_number: street_number, building: building, phone_number: phone_number, order_id: order.id)
  end
end
