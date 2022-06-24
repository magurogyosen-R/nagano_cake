class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    if @order.invalid?
      render :new
    end
  end
  
  def create
    @order = Order(order.params)
    @order.customer.id = current_customer.id
    redirect_to root_path
  end

  def thanks
  end

  def index
    @order = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end
  
  private
  
  def order_params
    params.require(:order).permit(:address, :postcode, :payment_method, :name )
  end
  
end
