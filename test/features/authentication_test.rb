require "test_helper"

feature "Home Screen" do
  scenario "beautiful home screen" do
    visit root_path
    #save_and_open_page
    page.must_have_content "Sign up"

  end
  feature "Sign up path" do
    scenario "User can Sign up" do
      visit new_user_registration_path
      fill_in "Email", with: "supdude@example.com"
      fill_in "Password", with: "password11"
      fill_in "Password confirmation", with: "password11"
      click_button "Sign up"

      #save_and_open_page
      page.must_have_content "Welcome! You have signed up successfully."
      page.wont_have_content "There was a problem with your sign up"
    end
  end
  feature "Sign in path" do
    scenario "User can Sign in" do
      visit new_user_session_path
      fill_in "Email", with: users(:liam).email
      fill_in "Password", with: "password"

      click_button "Sign in"

      #save_and_open_page
      page.must_have_content "Welcome! You have signed in successfully."
      page.wont_have_content "There was a problem with your sign up"
end

