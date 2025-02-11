RSpec.describe SessionsController, type: :controller do
    let(:user) { create(:user) }
  
    describe "POST #create" do
      context "with valid credentials" do
        it "logs in the user" do
          post :create, params: { email: user.email, password: "password" }
          expect(session[:user_id]).to eq(user.id)
        end
      end
  
      context "with invalid credentials" do
        it "renders the login page" do
          post :create, params: { email: user.email, password: "wrongpassword" }
          expect(response).to render_template(:new)
        end
      end
    end
  
    describe "DELETE #destroy" do
      it "logs out the user" do
        session[:user_id] = user.id
        delete :destroy
        expect(session[:user_id]).to be_nil
      end
    end
  end
  