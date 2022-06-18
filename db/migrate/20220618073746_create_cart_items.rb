class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      
      t.integer :oder_id
      t.integer :item_id
      t.integer :buy_price
      t.integer :amount
      t.integer :production_sta
      
      t.timestamps
    end
  end
end
