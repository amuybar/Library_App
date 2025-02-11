require 'rails_helper'

RSpec.describe User, type: :model do
  # Associations
  it { should have_many(:borrowings) }

  # Validations
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }

  # Authentication
  describe "password security" do
    it "encrypts the password" do
      user = User.create(email: "test@example.com", password: "password123")
      expect(user.authenticate("password123")).to be_truthy
      expect(user.authenticate("wrongpassword")).to be_falsey
    end
  end
end
