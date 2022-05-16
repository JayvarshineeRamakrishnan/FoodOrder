class MenusController < ApplicationController
    before_action :ensure_user_logged_in
    
    def index
        @menus = Menu.all
        if session[:current_order_id] == nil
            orders = Order.where(user_id: current_user.id)
            if orders
              previous_order = orders.find_by(status: "notprocessed")
              if previous_order
                session[:current_order_id] = previous_order.id
              end
            end
            if session[:current_order_id] == nil
              user_id = current_user.id
              order = Order.create!(user_id: user_id, date: DateTime.now, delivered_at: nil, status: "notprocessed", price: 0)
              session[:current_order_id] = order.id
            end
        end
    end
end