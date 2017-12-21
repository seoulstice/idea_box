require "rails_helper"

describe "When a Visitor visits new session form" do
  it "the Visitor cannot sign in with false credentials" do
    User.create(name: "user", email: "user@gmail.com", password: "password", role: 0)

    visit login_path

    fill_in "session[email]", with: "user@gmail.com"
    fill_in "session[password]", with: "passwords"
    click_button "Log In"

    expect(current_path).to eq(login_path)
  end
  it "the Visitor can navigate to create new account" do
    visit login_path

    click_link "Create Account"

    expect(current_path).to eq(new_user_path)
  end
end
