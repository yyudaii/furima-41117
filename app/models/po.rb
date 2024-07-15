class Po
  include ActiveModel::Model
  attr_accessor :post, :area_id, :city, :address, :building, :tel, :user_id, :item_id, :token

  with_options presence: true do
  validates :post, format: { with: /\A\d{3}-\d{4}\z/ }
  validates :city
  validates :address
  validates :tel, format: { with: /\A\d+\z/ }, length: { minimum: 10, maximum: 11 }
  validates :token
  validates :user_id
  validates :item_id
  end

  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Purchase.create(post: post, area_id: area_id, city: city, address: address, building: building, tel: tel, order_id: order.id)
  end
end