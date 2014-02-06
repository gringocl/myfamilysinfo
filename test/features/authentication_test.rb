require "test_helper"

feature "User authentication" do
  scenario "User can Sign up" do
    visit new_user_registration_path
    fill_in "Email", with: "supdude@example.com"
    fill_in "Password", with: "password11"
    fill_in "Password confirmation", with: "password11"
    click_button "Sign up"

    page.must_have_content "Welcome! You have signed up successfully."
    page.wont_have_content "There was a problem with your sign up"
  end

  scenario "User can Sign in" do
    sign_in(:liam)
    page.must_have_content "Signed in successfully."
    page.wont_have_content "There was a problem with your sign up"
  end

  scenario "User can Sign out" do
    sign_in(:liam)
    click_on "Logout"
    page.must_have_content "Signed out successfully."
  end

  scenario "A user can delete account" do
    sign_in(:liam)
    click_on "Edit account"
    click_on "Cancel my account"
    page.must_have_content "Bye! Your account was successfully cancelled. We hope to see you again soon."
  end

  scenario "A user can edit account and change password" do
    sign_in(:liam)
    click_on "Edit account"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    fill_in "Current password", with: "password"
    click_on "Update"
    page.must_have_content "You updated your account successfully."
  end
  scenario "sign in with twitter works" do
    visit root_path
    OmniAuth.config.test_mode = true
    Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
    Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
    OmniAuth.config.add_mock(:twitter,
      { uid: '12345',
        info: { nickname: 'test_twitter_user'},
        })
    click_on "Sign in with Twitter"
    #binding.pry
    save_and_open_page
    page.must_have_content "test_twitter_user, you are signed in!"
  end
end

