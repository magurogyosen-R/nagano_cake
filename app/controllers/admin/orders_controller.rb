class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all.page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total_price = 0
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @order.update(order_params)
    if @order.order_status  == "入金確認"
      @order_details.update_all(production_status: "製作待ち")
    end
      redirect_to admin_order_path(@order.id)
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end

end
