class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @items = Item.where(sale_status: "販売可")
  end

  def about
  end
end
