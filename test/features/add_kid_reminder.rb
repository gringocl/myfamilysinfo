require "test_helper"

feature "Manage your kids reminders" do
  scenario "View your kids reminders" do
    sign_in(:mother)
    #save_and_open_page
    page.must_have_content "Jenny"
    page.must_have_content "Advil"
  end

  scenario "Add a new reminder for your kid" do
    sign_in(:mother)
    click_on "Add Reminder for #{kids(:Jenny).name}"
    fill_in "reminder_name", with: "Tylenol"
    click_on "Create Reminder"
    page.must_have_content "Jenny"
    page.must_have_content "Tylenol"
  end

  scenario "Update a current reminder" do
    sign_in(:mother)
    #save_and_open_page
    find
    page.must_have_content "Updated!"
    page.must_have_content "less than a minute ago"
  end
  scenario "Delete Reminder" do
    sign_in(:mother)
    click_on 'Remove Reminder'
    page.must_have_content "Success!"
  end

end
