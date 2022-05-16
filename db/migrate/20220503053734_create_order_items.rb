class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.integer :order_id
      t.integer :menu_id
      t.string :menu_name
      t.decimal :menu_price

      t.timestamps
    end
  end
end
