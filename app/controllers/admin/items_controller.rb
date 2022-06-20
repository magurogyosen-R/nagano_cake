class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    item.save
    redirect_to '/admin/items'
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end
end

private
  def item_params
    params.require(:item).permit(:name, :introduction, :image, :price)
  end