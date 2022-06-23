class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @items = Item.page(params[:page]).per(8)
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
  end
end

private
  def item_params
    params.require(:item).permit(:name, :introduction, :image, :price, :id, :genre_name, :sale_status)
  end