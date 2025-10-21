module ProductsHelper
  def favorites_icon_color(product_id:, wishlist_product_ids:)
    favorite_product?(product_id:, wishlist_product_ids:) ? :red : :gray
  end

  def favorite_product?(product_id:, wishlist_product_ids:)
    wishlist_product_ids.any?(product_id)
  end
end
