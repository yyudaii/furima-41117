class ChangeOrderIdColumnTypeInPurchases < ActiveRecord::Migration[7.0]
  def change
    change_column :purchases,:order_id,:integer
  end
end
