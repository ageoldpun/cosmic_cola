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
    if session[:cart_contents].exclude?(params[:type])
      session[:cart_count] += 1
      session[:cart_contents].push(params[:type])
    end
    redirect_to "/checkout"
  end

  def submit
    OrderMailer.order(params).deliver_now
    Pusher.trigger('new_orders', 'order', {
      message: params
    })
    session[:cart_count] = 0
    session[:cart_contents] = []
    redirect_to "/complete"
  end
end
