class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :name
      t.string :postcode
      t.string :address
      t.integer :order_status
      t.integer :payment
      t.integer :freight
      t.integer :total_cost

      t.timestamps
    end
  end
end
