require "test_helper"

feature "Add a ward" do
  scenario "Add a new kid" do
    sign_in(:mother)
    click_on "Dashboard"
    click_on "Add Kid"
    fill_in "Name", with: "Tim"
    select "Father", from: 'kid_relationships_attributes_0_role'
    click_on "Create Kid"
    page.must_have_content "Tim"
    page.must_have_content "Remove Kid"
  end

  scenario "Edit a Ward" do
    sign_in(:mother)
    click_on "Dashboard"
    click_on "Add Kid"
    fill_in "Name", with: "Lila"
    select "Father", from: 'kid_relationships_attributes_0_role'
    click_on "Create Kid"
    click_on "Lila"
    fill_in "Name", with: "Johnny"
    click_on "Save Changes"
    page.must_have_content "Success"
  end

  scenario "Delete a Ward" do
    sign_in(:mother)
    click_on "Dashboard"
    click_on "Add Kid"
    fill_in "Name", with: "Lila"
    select "Father", from: 'kid_relationships_attributes_0_role'
    click_on "Create Kid"
    click_on "Remove Kid"
    page.must_have_content "Are you sure?"
    click_on "Yes"
    page.must_have_content "Kid Removed"
  end
end
