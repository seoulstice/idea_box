require "rails_helper"

describe "When a User visits new session form" do
  it "the User can sign in with correct credentials" do
    user = User.create(name: "user", email: "user@gmail.com", password: "password", role: 0)
    visit login_path

    fill_in "session[email]", with: "user@gmail.com"
    fill_in "session[password]", with: "password"
    click_button "Log In"

    expect(current_path).to eq(user_path(user))
  end
end
