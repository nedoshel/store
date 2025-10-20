require "rails_helper"

RSpec.describe Current, type: :model do
  let(:session) { build_stubbed(:session) }
  it "exposes a session attribute" do
    expect(Current).to respond_to(:session, :session=)
  end

  it { should delegate_method(:user).to(:session).allow_nil }

  it "returns nil when session is nil" do
    Current.session = nil

    expect(Current.user).to be_nil
  end

  it "returns the user delegated from session" do
    Current.session = session

    expect(Current.user).to eq(session.user)
  end
end
