class Public::ItemsController < ApplicationController

  def index
    @genres = Genre.all
    @item_all = Item.where(sale_status: true)
    @items = @item_all.page(params[:page]).per(8)
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end

private
  def item_params
    params.require(:item).permit(:name, :introduction, :image, :price, :id, :genre_name, :sale_status)
  end