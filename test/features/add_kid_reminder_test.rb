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
    #save_and_open_page
    page.find("a[href='#{new_user_kid_reminder_path(kids(:Jenny))}']").click
    #click_on "button radius tiny success for #{kids(:Jenny).name}"
    fill_in "reminder_name", with: "Tylenol"
    click_on "Add"
    page.must_have_content "Jenny"
    page.must_have_content "Tylenol"
  end

  scenario "Update a current reminder" do
    sign_in(:mother)
    #save_and_open_page
    page.find("a[href='#{new_user_kid_reminder_path(kids(:Jenny))}']").click
    fill_in "reminder_name", with: "Tylenol"
    click_on "Add"
    page.must_have_content "Jenny"
    page.must_have_content "Tylenol"
    # page.must_have_content "reminder was updated!"
    # page.must_have_content "less than a minute ago"
  end
  # scenario "Delete Reminder" do
  #   sign_in(:mother)
  #   page.find("a[data-method][href='#{reminder_path(kids(:Jenny))}']").click
  #   page.must_have_content "Success!"
  # end

end
