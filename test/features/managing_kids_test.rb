require "test_helper"

feature "Add a kid" do
  scenario "Add a new kid" do
    sign_in(:mother)
    #save_and_open_page
    click_on "Add a kid"
    fill_in "Name", with: "Tim"
    click_on "Add"
    page.must_have_content "Tim"
    #page.must_have_content "Remove Kid"
  end

  scenario "Delete a kid" do
    sign_in(:mother)
    page.find("a[data-confirm][href='#{kid_path(kids(:Jenny))}']").click
    #first(:link, 'Delete!').click
    #save_and_open_page
    page.must_have_content "Jenny was removed from your account"
  end
end
