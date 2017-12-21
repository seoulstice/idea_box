require "rails_helper"

describe "When a Visitor visits new session form" do
  it "the Visitor cannot sign in with false credentials" do
    user = create(:user)

    visit login_path

    fill_in "session[email]", with: "JohnDoe@123.com"
    fill_in "session[password]", with: "124"

    expect(current_path).to eq(login_path)
  end
  it "the Visitor can navigate to create new account" do
    visit login_path

    click_link "Create Account"

    expect(current_path).to eq(new_user_path)
  end
end
