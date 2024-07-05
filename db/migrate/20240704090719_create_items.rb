class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :user, null: false, forign_key: true
      t.string :name, null: false
      t.text :message, null: false

      t.integer :genre_id , null: false
      t.integer :category, null: false
      t.integer :condition, null: false
      t.integer :shipping_fee, null: false
      t.integer :area, null: false
      t.integer :delay, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
