class OrdersController < ApplicationController
    def index
    end

    def checkout
    end

    def create
        @order = Order.new(params[:order])
    end
end
