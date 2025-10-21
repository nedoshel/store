class Products::WishlistsController < ApplicationController
  before_action :set_product
  before_action :set_wishlist

  def create
    @wishlist.wishlist_products.create(product: @product)

    render_turbo_product
  end

  def destroy
    @wishlist.wishlist_products.where(product_id: params[:product_id]).destroy_all

    render_turbo_product
  end

  private
    def set_product
      @product = Product.find(params[:product_id])
    end

    def set_wishlist
      if (id = params[:wishlist_id])
        @wishlist = Current.user.wishlists.find(id)
      else
        @wishlist = Current.user.wishlists.find_or_create_by(name: Wishlist::DEFAULT_FAVORITE_NAME)
      end
    end

    def render_turbo_product
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream_renderer
        end
      end
    end


    def turbo_stream_renderer
      turbo_stream.replace(
        ApplicationController.helpers.dom_id(@product, :favorite),
        partial: "products/favorite",
        locals: { product: @product.reload, wishlist_product_ids: wishlist_product_ids }
      )
    end

    def wishlist_product_ids
      Current.user.favorite_product_ids
    end
end
