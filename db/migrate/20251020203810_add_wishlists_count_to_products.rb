class AddWishlistsCountToProducts < ActiveRecord::Migration[8.2]
  def change
    add_column :products, :wishlists_count, :integer, default: 0, null: false
  end
end
