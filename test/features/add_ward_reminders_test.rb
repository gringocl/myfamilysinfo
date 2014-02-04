require "test_helper"

feature "Manager your wards reminders" do
  scenario "View your wards reminders" do
    sign_in(:mother)
    click_on "#{wards(:tiny)}"
    page.must_have_content "Tiny's Reminders"
    page.wont_have_content "Princess's Reminders"
  end

  scenario "Add a new reminder for you ward" do
    sign_in(:mother)
    click_on "New reminder"
    fill_in "Name", with: "New reminder"
    fill_in "Description", with: "A little description"
    select '8 hours', from: 'Frequency'
    select 'email', from: 'Method'
    click_on "Create"
    page.must_have_content "Success"
    page.must_have_content "New reminder"
  end

  scenario "Edit a current reminder" do
    sign_in(:mother)
    click_on reminders(:first).name
    fill_in "Description", with: "Change the description"
    select '4 hours', from: 'Frequency'
    click_on 'Update'
    page.must_have_content "Success"
    page.must_have_content "Change the description"
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

  scenario "View up coming reminders" do
    sign_in(:mother)
    page.must_have_content "#{wards(:tiny).name}: #{reminders(:first).name}"
    page.must_have_content "#{wards(:tiny).name}: #{reminders(:second).name}"
    page.must_have_content "#{wards(:tiny).name}: #{reminders(:thire).name}"
  end
end
