class WishlistProduct < ApplicationRecord
  belongs_to :product, counter_cache: :wishlists_count, touch: true
  belongs_to :wishlist, counter_cache: :products_count

  validates :product_id, uniqueness: { scope: :wishlist_id }

  scope :by_wishlist, ->(wishlist) { where(wishlist: wishlist) }
end
