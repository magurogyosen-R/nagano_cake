class RemoveGenreNameFromItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :name, :string
  end
end
