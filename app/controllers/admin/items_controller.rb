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
    @items = Item.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_item_path(item.id)
  end

  def to_boolean
     if sale_status == "true"
       true
     elsif self == "false"
       false
     end
  end

end

private
  def item_params
    params.require(:item).permit(:name, :introduction, :image, :price, :id, :genre_name, :sale_status)
  end