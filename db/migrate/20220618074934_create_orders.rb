class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :name
      t.string :postcode
      t.string :address
      t.integer :order_status, null: false, default: 0
      t.integer :payment, null: false, default: 0
      t.integer :freight, null: false
      t.integer :total_cost, default: 0

      t.timestamps
    end
  end
end
