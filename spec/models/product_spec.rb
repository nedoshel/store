require "rails_helper"

RSpec.describe Product, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }

    it { should validate_numericality_of(:inventory_count).is_greater_than_or_equal_to(0) }
  end

  describe "associations and attachments" do
    it { is_expected.to have_many(:subscribers).dependent(:destroy) }

    it { should have_one_attached(:featured_image) }

    it { should have_rich_text(:description) }
  end

  describe "mixins" do
    it "includes Notifications module" do
      expect(described_class.ancestors).to include(Product::Notifications)
    end
  end
end
