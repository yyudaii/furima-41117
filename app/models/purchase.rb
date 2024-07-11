class Purchase < ApplicationRecord
  belongs_to :order
  belongs_to :area, optional: true
end
