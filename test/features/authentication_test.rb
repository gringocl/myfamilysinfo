require "test_helper"

feature "Sign in" do
  scenario "user can sign in" do
    visit root_path
    sign_in
    page.must_have_content "Hello World"
    page.wont_have_content "Goobye All!"
  end
end
