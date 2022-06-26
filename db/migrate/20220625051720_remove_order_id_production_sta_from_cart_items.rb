class RemoveOrderIdProductionStaFromCartItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :cart_items, :order_id, :integer
    remove_column :cart_items, :production_sta, :integer
  end
end
