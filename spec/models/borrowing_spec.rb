require 'rails_helper'

RSpec.describe Borrowing, type: :model do
  # Associations
  it { should belong_to(:user) }
  it { should belong_to(:book) }

  # Custom Validations
  describe "book_availability validation" do
    let(:user) { create(:user) }
    let(:book) { create(:book) }

    context "when the book is available" do
      it "allows borrowing" do
        borrowing = Borrowing.new(user: user, book: book)
        expect(borrowing.valid?).to be true
      end
    end

    context "when the book is already borrowed" do
      before { create(:borrowing, book: book, user: user, returned_at: nil) } # Simulate book already borrowed

      it "does not allow borrowing" do
        new_borrowing = Borrowing.new(user: user, book: book)
        new_borrowing.valid?
        expect(new_borrowing.errors[:book]).to include("is already borrowed")
      end
    end
  end

  # Callbacks
  describe "set_due_date callback" do
    let(:borrowing) { create(:borrowing) }

    it "sets the due_date to 2 weeks from now" do
      expect(borrowing.due_date).to be_within(1.second).of(2.weeks.from_now)
    end
  end
end
