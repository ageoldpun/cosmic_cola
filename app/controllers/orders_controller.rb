class OrdersController < ApplicationController
    def index
        if !session[:cart_count]
            session[:cart_count] = 0
        end
        if !session[:cart_contents]
            session[:cart_contents] = []
        end
    end

    def checkout
    end

    def create
        session[:cart_count] = session[:cart_count] + 1
        session[:cart_contents].push(params[:type])
        @order = Order.new(params[:order])
        redirect_to "/checkout"
    end
end
