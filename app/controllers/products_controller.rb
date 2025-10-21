class ProductsController < ApplicationController
  allow_unauthenticated_access

  before_action :set_product, only: %i[ show ]

  # GET /products or /products.json
  def index
    @products = Product.preload(:featured_image_attachment, :featured_image_blob).order(:id)
    @wishlist_product_ids = resume_session&.user&.wishlist_products&.pluck(:product_id) || []
  end

  # GET /products/1 or /products/1.json
  def show
  end

  private

  def set_product
    @product = Product.find(params.expect(:id))
  end
end
