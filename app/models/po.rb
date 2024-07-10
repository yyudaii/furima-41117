class Po
  include ActiveModel::Model
  attr_accessor :card, :deadline, :security, :post, :prefecture, :city, :adress, :building, :tel

  validates :card, presence: true
  validates :deadline, presence: true
  validates :security, presence: true
  validates :post, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :tel, presence: true

end