class AddDetailsToPurchases < ActiveRecord::Migration[7.0]
  def change
    add_column :purchases, :card, :string
    add_column :purchases, :deadline, :string
    add_column :purchases, :security, :string
    add_column :purchases, :post, :string
    add_column :purchases, :prefecture_id, :integer
    add_column :purchases, :city, :string
    add_column :purchases, :address, :string
    add_column :purchases, :building, :string
    add_column :purchases, :tel, :integer
  end
end
