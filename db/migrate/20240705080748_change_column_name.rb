class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :items, :category, :category_id
    rename_column :items, :condition, :condition_id
    rename_column :items, :shipping_fee, :shipping_fee_id
    rename_column :items, :area, :area_id
    rename_column :items, :delay, :delay_id
  end
end
