require 'rails_helper'

describe "When a Visitor visits root" do
  it "and clicks on Concert Box" do
    visit "/"

    click_link(".concertBox")

    expect(current_path).to eq(login_path)
    expect(page).to have_content(".concertBox log in")
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
    expect(page).to have_button("Log In")
    expect(page).to have_content("Need an account?")
    expect(page).to have_link("Create Account")
  end
end
