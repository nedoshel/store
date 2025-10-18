class AddInventoryCountToProducts < ActiveRecord::Migration[8.2]
  def change
    add_column :products, :inventory_count, :integer
  end
end
