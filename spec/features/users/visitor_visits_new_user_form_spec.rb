require "rails_helper"

describe "When a Visitor navigates to new User form" do
  it "the Visitor can see the form" do
    visit new_user_path

    expect(page).to have_content("Create an Idea Box Account")
    expect(page).to have_content("Name")
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
    expect(page).to have_content("Confirm Password")
    expect(page).to have_button("Create User")
  end
end
