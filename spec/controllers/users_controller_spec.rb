require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:valid_attributes) { { email: "test@example.com", password: "password" } }
  let(:invalid_attributes) { { email: "", password: "" } }
  let(:user) { create(:user) }

  describe "GET #new" do
    it "renders the new user form successfully" do
      get :new
      expect(response).to have_http_status(:ok)
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new user and redirects to login" do
        expect {
          post :create, params: { user: valid_attributes }
        }.to change(User, :count).by(1)

        expect(response).to redirect_to(login_path)
        expect(flash[:notice]).to eq("User created successfully!")
      end
    end

    context "with invalid attributes" do
      it "does not create a new user and re-renders new" do
        expect {
          post :create, params: { user: invalid_attributes }
        }.not_to change(User, :count)

        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET #show" do
    context "when logged in" do
      before { session[:user_id] = user.id }

      it "retrieves the user's active borrowings" do
        borrowing = create(:borrowing, user: user, returned_at: nil)
        get :show
        expect(response).to have_http_status(:ok)
        expect(assigns(:borrowings)).to include(borrowing)
      end
    end

    context "when not logged in" do
      it "redirects to login page" do
        get :show
        expect(response).to redirect_to(login_path)
      end
    end
  end
end
