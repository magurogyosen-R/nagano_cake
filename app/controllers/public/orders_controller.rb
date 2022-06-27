class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = Address.where(customer_id: current_customer.id)
  end

  def confirm
    @order = Order.new(order_params)
    @order.freight = 800
    if params[:order][:address_number] == "0"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.name = current_customer.last_name+current_customer.first_name
    elsif params[:order][:address_number] == "1"
      @order.postcode = Address.find(params[:order][:address]).postcode
      @order.address = Address.find(params[:order][:address]).addresses
      @order.name = Address.find(params[:order][:address]).name
    elsif params[:order][:address_number] == "2"
      @order.customer_id = current_customer.id
    else
      redirect_to root_path
    end
    @cart_items = CartItem.where(customer_id: current_customer.id)
  end

  def create
    @order = Order.new(order_params)
    @order.customer = current_customer
    @order.save
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart_item.item.id
      @order_detail.order_id = @order.id
      @order_detail.amount = cart_item.amount
      @order_detail.buy_price = cart_item.item.price
      @order_detail.save
    end
    current_customer.cart_items.destroy_all
    redirect_to thanks_public_orders_path
  end

  def thanks
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_detail = @order.order_details
    @total_price = 0
    @total = 0
  end

  private

  def order_params
    params.require(:order).permit(:address, :postcode, :payment, :name, :freight, :total_cost )
  end

  def address_params
    params.permit(:addresses, :name, :postcode, :customer_id, :address_number )
  end

end
