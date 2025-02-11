require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  let!(:books) { create_list(:book, 3) }
  let(:book) { books.first }

  describe "GET #index" do
    it "retrieves all books successfully" do
      get :index
      expect(response).to have_http_status(:ok)
      expect(assigns(:books)).to match_array(books)
    end
  end

  describe "GET #show" do
    it "retrieves the requested book successfully" do
      get :show, params: { id: book.id }
      expect(response).to have_http_status(:ok)
      expect(assigns(:book)).to eq(book)
    end
  end

  describe "authentication enforcement" do
    context "when user is not logged in" do
      it "allows access to index" do
        get :index
        expect(response).to have_http_status(:ok)
      end

      it "allows access to show" do
        get :show, params: { id: book.id }
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
