require 'rails_helper'

RSpec.describe WishlistProduct, type: :model do
  describe "associations" do
    it { should belong_to(:product).counter_cache(:wishlists_count) }
    it { should belong_to(:wishlist).counter_cache(:products_count) }
  end

  describe "validations" do
    let(:product) { create(:product) }
    let(:user) { create(:user) }
    let(:wishlist) { Wishlist.create(name: "My Wishlist", user: create(:user)) }

    subject { described_class.new(product: product, wishlist: wishlist) }

    it { should validate_uniqueness_of(:product_id).scoped_to(:wishlist_id) }
  end
end
