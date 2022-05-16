class OrdersController < ApplicationController
    before_action :ensure_user_logged_in

    def index
        @orders = @current_user.orders.where(status: "notdelivered").order("created_at DESC")
    end

    def cart
        if session[:current_order_id] == nil
            flash[:alert] = "Your Cart Is Empty"
            redirect_to menus_path
        else
            order = Order.find(session[:current_order_id])
            order.price = order.totalPrice
            order.save
            if order.price > 0
              render "cart", locals: { order: order }
            else
              flash[:alert] = "Your cart is empty.May be items added by you were removed."
              redirect_to menus_path
            end
        end
    end

    def confirm
        @order = Order.find(session[:current_order_id])
        @order.status = "notdelivered"
        @order.save
        @user = User.find(@order.user_id)
        ConfirmOrderMailer.with(order: @order,user: @user).order_confirmation.deliver_later
        session[:current_order_id] = nil
        redirect_to orders_index_path
    end

end
