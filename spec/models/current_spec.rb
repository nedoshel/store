require "rails_helper"

RSpec.describe Current, type: :model do
  after do
    Current.session = nil
  end

  it "exposes a session attribute" do
    expect(Current).to respond_to(:session)
    expect(Current).to respond_to(:session=)
  end

  it { should delegate_method(:user).to(:session).allow_nil }

  it "returns nil when session is nil" do
    Current.session = nil
    expect(Current.user).to be_nil
  end

  it "returns nil when session.user is nil" do
    session = double("session", user: nil)
    Current.session = session
    expect(Current.user).to be_nil
  end
end
