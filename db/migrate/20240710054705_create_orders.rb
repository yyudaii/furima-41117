class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      #t.integer :prefecture_id, null: false
      #t.timestamps
    end
  end
end
