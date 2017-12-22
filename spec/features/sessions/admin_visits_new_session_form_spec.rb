require "rails_helper"

describe "When Admin User navigates to the new session form" do
  it "the Admin User can sign in with proper credentials" do
    user = User.create(name: "admin",
                      email: "admin@gmail.com",
                      password: "admin",
                      role: 1)

    visit login_path

    fill_in "session[email]", with: "admin@gmail.com"
    fill_in "session[password]", with: "admin"
    click_button "Log In"

    expect(current_path).to eq(user_path(user))
    expect(user.role).to eq("admin")
    expect(page).to have_content("Admin Dashboard")
  end
end
