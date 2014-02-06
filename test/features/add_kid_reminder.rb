require "test_helper"

feature "Manage your kids reminders" do
  scenario "View your kids reminders" do
    sign_in(:mother)
    click_on "Dashboard"
    click_on "Add Kid"
    fill_in "Name", with: "Tim"
    select "Father", from: 'kid_relationships_attributes_0_role'
    click_on "Create Kid"
    click_on "Add Reminder"
    #visit new_user_kid_reminder_path
    fill_in "reminder_name", with: "Tylenol"
    click_on "Create Reminder"
    # save_and_open_page
    page.must_have_content "Tim"
    page.must_have_content "Tylenol"
  end

  scenario "Add a new reminder for your kid" do
    sign_in(:mother)
    click_on "Dashboard"
    click_on "Add Kid"
    fill_in "Name", with: "Tim"
    select "Father", from: 'kid_relationships_attributes_0_role'
    click_on "Create Kid"
    click_on "Add Reminder"
    #visit new_user_kid_reminder_path
    fill_in "reminder_name", with: "Tylenol"
    click_on "Create Reminder"
    # save_and_open_page
    page.must_have_content "Tim"
    page.must_have_content "Tylenol"
  end

  scenario "Update a current reminder" do
    sign_in(:mother)
    click_on "Dashboard"
    find(:k1).name
    click_on 'Update'
    page.must_have_content "Updated!"
    page.must_have_content "less than a minute ago"
  end

  scenario "Complete reminder" do
    sign_in(:mother)
    click_on reminders(:second).name
    click_on 'Complete Reminder'
    page.must_have_content "Success"
    page.wont_have_content "#{reminders(:second).name}"
  end

  scenario "Delete Reminder" do
    sign_in(:mother)
    click_on reminders(:done).name
    click_on 'Delete Reminder'
    page.must_have_content "Success"
    click_on 'Completed Reminders'
    page.wont_have_content "#{reminders(:done).name}"
  end

end
