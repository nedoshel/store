class Wishlist < ApplicationRecord
  DEFAULT_NAME = "favorites".freeze

  belongs_to :user
  has_many :wishlist_products, dependent: :destroy
  has_many :products, through: :wishlist_products

  to_param :name
end
