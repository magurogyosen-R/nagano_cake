class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_cart
  end

  def destroy
    cart_item = Cart_Item.find(params[:id])
    cart_item.destroy
  end

  def destroy_all
    cart_item = Cart_Item.where(cart_item)
    cart_item.destroy_all
  end

  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end