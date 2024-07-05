class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :user, null: false, forign_key: true
      t.string :name, null: false
      t.text :message, null: false

      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :shipping_fee_id, null: false
      t.integer :area_id, null: false
      t.integer :delay_id, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
