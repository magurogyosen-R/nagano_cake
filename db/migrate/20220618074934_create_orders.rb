class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.string :name, null: false
      t.string :postcode, null: false
      t.string :address, null: false
      t.integer :order_status, null: false, default: 0
      t.integer :payment, null: false, default: 0
      t.integer :freight, null: false
      t.integer :total_cost, null: false

      t.timestamps
    end
  end
end
