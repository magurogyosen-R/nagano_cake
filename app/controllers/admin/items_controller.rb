class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    if item.save
      redirect_to item_path(@item.id)
    else
      @item = Item.new
      render 'new'
    end
  end

  def index
    @items = Item.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end

  def to_boolean
     if sale_status == "true"
       true
     elsif self == "false"
       false
     end
  end

  private
    def item_params
      params.require(:item).permit(:name, :introduction, :image, :price, :id, :genre_name, :sale_status)
    end
end