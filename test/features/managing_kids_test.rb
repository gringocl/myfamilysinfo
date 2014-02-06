require "test_helper"

feature "Add a kid" do
  scenario "Add a new kid" do
    sign_in(:mother)
    click_on "Add Kid"
    fill_in "Name", with: "Tim"
    click_on "Create Kid"
    page.must_have_content "Tim"
    page.must_have_content "Remove Kid"
  end

  scenario "Delete a kid" do
    sign_in(:mother)
    save_and_open_page
    find "Jenny"
    click_on "Remove Kid"
    page.must_have_content "Are you sure?"
    click_on "Yes"
    page.must_have_content "Kid Removed"
  end
end
