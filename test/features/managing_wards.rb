require "test_helper"

feature "Add a ward" do
  scenario "Guardian adds a ward" do
    sign_in(:mother)
    click_on "Add Ward"
    fill_in "First Name", with: "River"
    fill_in "First Last", with: "River"
    fill_in "Birthday", with: "7/24/99"
    click_on "Create"
    page.must_have_content "Success"
    page.must_have_content "View Your kiddo"

  end

  scenario "Edit a Ward" do
    sign_in(:mother)
    click_on "Lila"
    click_on "Edit Lila"
    fill_in "Name", with: "Johnny"
    click_on "Save Changes"
    page.must_have_content "Success"
  end

  scenario "Delete a Ward" do
    sign_in(:mother)
    click_on "Lila"
    click_on "Edit Lila"
    click_on "Delete Lila"
    page.must_have_content "Are you sure?"
    click_on "Yes"
    page.must_have_content "Ward Deleted"
  end
end
