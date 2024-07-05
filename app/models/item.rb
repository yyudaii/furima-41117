class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee, class_name: 'Shipping_Fee'
  belongs_to :area
  belongs_to :delay
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :message, presence: true

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delay_id, numericality: { other_than: 1, message: "can't be blank" }

end
