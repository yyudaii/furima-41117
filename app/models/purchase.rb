class Purchase < ApplicationRecord
  belongs_to :order
  has_one :user
  belongs_to :area, optional: true
end
