require "test_helper"

feature "More info section of home page" do
  scenario "User can learn more about our app" do
    visit root_path
    page.must_have_link "Learn More"
    page.must_have_content "Remind"
    page.must_have_content "Recurring"
    page.must_have_content "Child"
  end
end
