require "test_helper"

feature "More info section of home page" do
  scenario "User can learn more about our app" do
    visit root_path
    page.must_have_link "Use our App!"
    page.must_have_content "Sign Up Now!"
  end
end
