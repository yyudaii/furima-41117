class AddDetailsToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :user_id, :integer, null: false
    add_column :orders, :item_id, :integer, null: false
  end
end
