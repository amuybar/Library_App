require 'rails_helper'

RSpec.describe "User Authentication", type: :system do
  let(:user) { create(:user, password: "password") }

  it "allows user to log in and out" do
    visit login_path

    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_button "Login"

    expect(page).to have_content("Logged in successfully")

    click_link "Logout"
    expect(page).to have_content("Logged out successfully")
  end
end
