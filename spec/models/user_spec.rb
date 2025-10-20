require "rails_helper"

RSpec.describe User, type: :model do
  subject { build(:user) }
  # associations & secure password
  it { should have_secure_password }
  it { should have_many(:sessions).dependent(:destroy) }

  # validations
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_uniqueness_of(:email_address).case_insensitive }

  describe "email normalization" do
    before do
      subject.email_address = "FOO@ExAmple.CoM"
    end

    it "strips whitespace and downcases email_address on save" do
      expect(subject.email_address).to eq("foo@example.com")
    end
  end

  describe "#confirm_email" do
    subject { user.confirm_email }
    let(:user) { create(:user, unconfirmed_email: "new@example.com") }

    it "moves unconfirmed_email to email_address and clears unconfirmed_email" do
      expect { subject }.to change { user.email_address }.from("user@example.com").to eq("new@example.com")
      expect(user.unconfirmed_email).to be_nil
    end
  end

  describe "#full_name" do
    let(:user) { build(:user, first_name: "John", last_name: "Doe") }
    it "returns first and last name joined" do
      expect(user.full_name).to eq("John Doe")
    end
  end

  describe "attr_readonly :admin" do
     it { should have_readonly_attribute(:admin) }
  end
end
