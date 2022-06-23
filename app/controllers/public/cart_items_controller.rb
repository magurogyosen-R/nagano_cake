class Public::CartItemsController < ApplicationController
  def create
    cart_item = CartItem.new(cart_item_params)
    item.save
    redirect_to cart_item_path(@cart_item.id)
  end

  def index
    @order = Order.new
    @cart_items = CartItem.all
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
  end

  def destroy_all
    cart_item = CartItem.where(cart_item)
    cart_item.destroy_all
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end