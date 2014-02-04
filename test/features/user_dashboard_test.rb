require "test_helper"

feature "User Dashboard" do
  scenario "User dashboard is visited after sign in" do
    sign_in(:mother)
    page.must_have_content "Welcome #{users(:mother).name}"
    page.must_have_link "Update my profile"
    page.must_have_link "Reset Password"
    page.must_have_button "View Reminders"
    page.must_have_button "Add Child"
    page.must_have_content "Upcoming reminders"
  end


end
