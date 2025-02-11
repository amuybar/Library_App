require 'rails_helper'

RSpec.describe BorrowingsController, type: :controller do
  let(:user) { create(:user) }
  let(:book) { create(:book) }
  
  before do
    allow(controller).to receive(:current_user).and_return(user) # Mock authentication
  end

  describe "POST #create" do
    context "when user is logged in" do
      it "allows a user to borrow a book" do
        expect {
          post :create, params: { book_id: book.id }
        }.to change(Borrowing, :count).by(1)

        expect(response).to redirect_to(profile_path)
      end
    end

    context "when user is not logged in" do
      before { allow(controller).to receive(:current_user).and_return(nil) }

      it "redirects to login page" do
        post :create, params: { book_id: book.id }
        expect(response).to redirect_to(login_path)
      end
    end
  end

  describe "POST #return" do
    let!(:borrowing) { create(:borrowing, user: user, book: book) }

    it "marks a book as returned" do
      post :return, params: { id: borrowing.id }
      expect(borrowing.reload.returned_at).not_to be_nil
      expect(response).to redirect_to(profile_path)
    end
  end
end
