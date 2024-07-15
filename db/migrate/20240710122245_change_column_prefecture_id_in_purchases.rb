class ChangeColumnPrefectureIdInPurchases < ActiveRecord::Migration[7.0]
  def change
    rename_column :purchases, :prefecture_id, :area_id
  end
end
