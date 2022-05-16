class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.date :date
      t.datetime :delivered_at
      t.bigint :user_id
      t.string :status
      t.integer :price

      t.timestamps
    end
  end
end
