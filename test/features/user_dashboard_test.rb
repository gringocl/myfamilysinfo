require "test_helper"

feature "User Dashboard" do
  scenario "User dashboard is visited after sign in" do
    sign_in(:mother)
    page.must_have_content "Signed in as mother@example.com"
    page.must_have_link "Edit account"
    #save_and_open_page
    page.must_have_link "Add a kid:"
    page.must_have_content "Jenny"
  end
end
