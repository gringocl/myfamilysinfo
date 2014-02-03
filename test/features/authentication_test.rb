require "test_helper"

feature "Home Screen" do
  scenario "beautiful home screen" do
    visit root_path
    #save_and_open_page
    page.must_have_content "Sign up"

  end
end
