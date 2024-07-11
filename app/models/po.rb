class Po
  include ActiveModel::Model
  attr_accessor :card, :deadline, :security, :post, :area_id, :city, :address, :building, :tel, :user_id, :item_id 

  validates :post, presence: true, format: { with: /\A\d{3}-\d{4}\z/ }
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :city, presence: true
  validates :address, presence: true
  validates :tel, presence: true, format: { with: /\A\d+\z/ }, length: { minimum: 10, maximum: 11 }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Purchase.create(card: card, deadline: deadline, security: security, post: post, area_id: area_id, city: city, address: address, building: building, tel: tel, order_id: order.id)
  end
end