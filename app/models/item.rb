class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :fee
  belongs_to :area
  belongs_to :delay
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :message, presence: true

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :fee_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delay_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true, numericality: { only_integer: true }
  validates :price, numericality: { greater_than_or_equal_to: 300, message: "must be greater than or equal to 300" }
  validates :price, numericality: { less_than_or_equal_to: 9_999_999, message: "must be less than or equal to 9,999,999" }
end
