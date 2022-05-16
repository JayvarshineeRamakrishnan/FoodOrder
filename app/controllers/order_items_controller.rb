class OrderItemsController < ApplicationController
    def decrement
      order_item = Order.find(session[:current_order_id]).order_items.find_by(menu_id: params[:id])
      if order_item.quantity > 1
        order_item.quantity = order_item.quantity - 1
        order_item.save
        flash[:notice] = "-1 #{order_item.menu_name}"
      else
        order_item.destroy
        flash[:notice] = "#{order_item.menu_name} removed successfully"
      end
      redirect_to menus_path
    end
  
    def increment
      order_item = Order.find(session[:current_order_id]).order_items.find_by(menu_id: params[:id])
      order_item.quantity = order_item.quantity + 1
      order_item.save
      flash[:notice] = "+1 #{order_item.menu_name}"
      redirect_to menus_path
    end
  
    def addToCart
      menu = Menu.find(params[:id])
      OrderItem.create!(order_id: session[:current_order_id], menu_name: menu.name, menu_id: menu.id, menu_price: menu.price, quantity: 1)
      flash[:notice] = "#{menu.name} added successfully"
      redirect_to menus_path
    end
  
    def decrementInCart
      order_item = OrderItem.find(params[:id])
      if order_item.quantity > 1
        order_item.quantity = order_item.quantity - 1
        order_item.save
        flash[:notice] = "-1 #{order_item.menu_name}"
      else
        flash[:notice] = "#{order_item.menu_name} removed successfully"
        order_item.destroy
      end
      redirect_to carts_path
    end
  
    def destroy
      id = params[:id]
      order_item = OrderItem.find(id)
      flash[:notice] = "#{order_item.menu_name} removed successfully"
      order_item.destroy
      redirect_to carts_path
    end
  
    def incrementInCart
      order_item = OrderItem.find(params[:id])
      order_item.quantity = order_item.quantity + 1
      order_item.save
      flash[:notice] = "+1 #{order_item.menu_name}"
      redirect_to carts_path
    end

    def viewOrderItems
      @order_items = OrderItem.where(order_id: params[:id])
      render "order_items/viewOrderItems"
    end
  end