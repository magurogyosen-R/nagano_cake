class AddSaleStatusToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :sale_status, :boolean
  end
end
