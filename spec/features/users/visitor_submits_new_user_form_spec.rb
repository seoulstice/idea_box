require "rails_helper"

describe "When the Visitor navigates to the new User form" do
  it "the User can create an account" do
    visit new_user_path

    fill_in "user[name]", with: "Jane Doe"
    fill_in "user[email]", with: "jdoe@gmail.com"
    fill_in "user[password]", with: "jdoe"
    fill_in "user[password_confirmation]", with: "jdoe"
    click_button "Create User"

    expect(current_path).to eq(user_path(User.last))
  end
end
