require 'rails_helper'

RSpec.describe Book, type: :model do
  # Associations
  it { should have_many(:borrowings) }
  it { should have_many(:users).through(:borrowings) }

  # Validations
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:isbn) }
  it { should validate_uniqueness_of(:isbn) }

  # Custom Methods
  describe "#borrowed?" do
    let(:book) { create(:book) }
    let(:user) { create(:user) }

    context "when the book is borrowed and not returned" do
      before { create(:borrowing, book: book, user: user, returned_at: nil) }

      it "returns true" do
        expect(book.borrowed?).to be true
      end
    end

    context "when the book has no active borrowings" do
      before { create(:borrowing, book: book, user: user, returned_at: Time.current) }

      it "returns false" do
        expect(book.borrowed?).to be false
      end
    end
  end
end
