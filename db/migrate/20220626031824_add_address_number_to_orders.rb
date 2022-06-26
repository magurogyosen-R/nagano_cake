class AddAddressNumberToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :address_number, :integer
  end
end
