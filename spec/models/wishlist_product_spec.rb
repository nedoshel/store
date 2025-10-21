require 'rails_helper'

RSpec.describe WishlistProduct, type: :model do
  describe "associations" do
    it { should belong_to(:product).counter_cache(:wishlists_count).touch }
    it { should belong_to(:wishlist).counter_cache(:products_count) }
  end

  describe "validations" do
    let(:product) { create(:product) }
    let(:user) { create(:user) }
    let(:wishlist) { Wishlist.create(name: "My Wishlist", user: create(:user)) }

    subject { described_class.new(product: product, wishlist: wishlist) }

    it { should validate_uniqueness_of(:product_id).scoped_to(:wishlist_id) }
  end

  describe "scopes" do
    let(:user) { create(:user) }
    let(:product) { create(:product) }
    let(:wishlist1) { Wishlist.create!(name: "w1", user: user) }
    let(:wishlist2) { Wishlist.create!(name: "w2", user: user) }

    before do
      WishlistProduct.create!(product: product, wishlist: wishlist2)
    end

    it "returns records for the given wishlist via .by_wishlist" do
      wishlist_product1 = WishlistProduct.create!(product: product, wishlist: wishlist1)

      expect(WishlistProduct.by_wishlist(wishlist1)).to contain_exactly(wishlist_product1)
    end
  end
end
