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

      click_button "Log in"

      #save_and_open_page
      page.must_have_content "Signed in successfully."
      page.wont_have_content "There was a problem with your sign up"
    end
  end
  feature "Sign out Path" do
    scenario "User can Sign out" do
      visit new_user_session_path
      fill_in "Email", with: users(:liam).email
      fill_in "Password", with: "password"

      click_button "Log in"
      click_on "Logout"
      page.must_have_content "Signed out successfully."
    end
  end
  feature "User account deletion" do
    scenario "A user can delete account" do
      visit new_user_session_path
      fill_in "Email", with: users(:liam).email
      fill_in "Password", with: "password"

      click_button "Log in"
      #save_and_open_page
      click_on "Edit account"
      click_on "Cancel my account"

      page.must_have_content "Bye! Your account was successfully cancelled. We hope to see you again soon."
    end
  end
  feature "User account password update" do
    scenario "A user can edit account and change password" do
      visit new_user_session_path
      fill_in "Email", with: users(:liam).email
      fill_in "Password", with: "password"

      click_button "Log in"
      #save_and_open_page
      click_on "Edit account"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      fill_in "Current password", with: "password"
      save_and_open_page
      click_on "Update"

      page.must_have_content "You updated your account successfully."
    end
  end
end

