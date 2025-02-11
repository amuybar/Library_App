require 'rails_helper'

RSpec.describe "Borrowing a book", type: :system do
  let(:user) { create(:user, password: "password") }
  let(:book) { create(:book) }

  it "lets a logged-in user borrow and return a book" do
    visit login_path
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_button "Login"

    visit book_path(book)
    click_button "Borrow"

    expect(page).to have_content("Book borrowed successfully!")

    click_button "Return"
    expect(page).to have_content("Book returned successfully!")
  end
end
