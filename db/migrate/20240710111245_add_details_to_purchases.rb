class AddDetailsToPurchases < ActiveRecord::Migration[7.0]
  def change
    #add_column :purchases, :card, :string
    #add_column :purchases, :deadline, :string
    #add_column :purchases, :security, :string
    add_column :purchases, :post, :string, null: false
    add_column :purchases, :prefecture_id, :integer, null: false
    add_column :purchases, :city, :string, null: false
    add_column :purchases, :address, :string, null: false
    add_column :purchases, :building, :string
    add_column :purchases, :tel, :string, null: false
    add_column :purchases, :order_id, :integer, null: false
  end
end
