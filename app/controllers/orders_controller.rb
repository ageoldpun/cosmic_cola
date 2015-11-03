class OrdersController < ApplicationController
    def index
        if !session[:cart_count]
            session[:cart_count] = 0
        end
    end

    def checkout
    end

    def create
        session[:cart_count] = session[:cart_count] + 1
        @order = Order.new(params[:order])
        redirect_to "/"
    end
end
