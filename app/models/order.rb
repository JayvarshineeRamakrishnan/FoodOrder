class Order < ApplicationRecord
    has_many :order_items, dependent: :delete_all
    belongs_to :user
    
      def totalPrice
        total_price = 0
        order_items.each do |order_item|
          total_price += order_item.total
        end
        total_price
      end
    
      def self.totalOrdersPrice
        total_price = 0
        all.each do |order|
          total_price += order.price
        end
        total_price
      end
end
