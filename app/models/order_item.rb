class OrderItem < ApplicationRecord
    belongs_to :order
    belongs_to :menu

    def total
        quantity * menu_price
    end

end
