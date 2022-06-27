class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all.page(params[:page])
    @order
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total_price = 0
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
   if  @order.update(order_params)
     redirect_to admin_order_path
   else
     render "show"
   end
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end

end
