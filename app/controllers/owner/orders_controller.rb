class Owner::OrdersController < ApplicationController
    def index
        @orders = Order.all
    end

end