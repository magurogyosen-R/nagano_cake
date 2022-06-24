class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = Address.where(customer_id: current_customer.id)
  end

  def confirm
    params[:order][:payment] = params[:order][:payment].to_i
    @order = Order.new(order_params)
    if params[:order][:address_number] == "0"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.name = current_customer.last_name+current_customer.first_name
    elsif params[:order][:address_number] == "1"
      @order.postcode = Address.find(params[:order][:address]).postcode
      @order.address = Address.find(params[:order][:address]).addresses
      @order.name = Address.find(params[:order][:address]).name
    elsif params[:order][:address_number] == "2"
      @address = Address.new()
      @address.addresses = params[:order][:addresses]
      @address.postcode = params[:order][:postcode]
      @address.name = params[:order][:name]
      @address.customer_id = current_customer.id
      if @address.save
        @order.postcode = @address.postcode
        @order.address = @address.addresses
        @order.name = @address.name
      else
        render "new"
      end
    end
  end

  def create
    @order = Order.new(order.params)
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
    params.require(:order).permit(:address, :postcode, :payment, :name )
  end

end
