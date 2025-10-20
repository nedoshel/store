require "rails_helper"

RSpec.describe Subscriber, type: :model do
  it { should belong_to(:product) }

  describe "token generation" do
    let(:subscriber) { create(:subscriber) }

    it "generates an unsubscribe token on create" do
      token = subscriber.generate_token_for(:unsubscribe)

      expect(described_class.find_by_token_for(:unsubscribe, token)).to eq(subscriber)
    end
  end
end
