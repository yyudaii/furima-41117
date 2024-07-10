class Po
  include ActiveModel::Model
  attr_accessor :card, :deadline, :security, :post, :prefecture_id, :city, :address, :building, :tel, :user_id, :item_id 

  validates :post, presence: true
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :city, presence: true
  validates :address, presence: true
  validates :tel, presence: true

  def save
    purchase = Purchase.create!(user_id: user_id, item_id: item_id)
    order.create!(card: card, deadline: deadline, security: security, post: post, area_id: area_id, city: city, address: address, building: building, tel: tel)
  end
end