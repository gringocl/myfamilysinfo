require "test_helper"

feature "Home Screen" do
  scenario "beautiful home screen" do
    visit root_path
    page.must_have_content "Sign up"
  end
end
