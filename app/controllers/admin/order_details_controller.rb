class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:production_statuses, :amount, :buy_price)
  end

end