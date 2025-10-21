require 'rails_helper'

RSpec.describe Wishlist, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:wishlist_products).dependent(:destroy) }

  describe "#to_param" do
    it "returns the name" do
      wishlist = described_class.new(id: 1_001, name: "my-wishlist")

      expect(wishlist.to_param).to eq("1001-my-wishlist")
    end
  end
end
