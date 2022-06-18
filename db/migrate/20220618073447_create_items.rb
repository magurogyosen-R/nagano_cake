class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.string :name
      t.string :introduction
      t.integer :price
      t.boolean :sale_status
      t.timestamps
    end
  end
end
