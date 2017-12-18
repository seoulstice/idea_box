require 'rails_helper'

describe 'When a Visitor visits root' do
  it "the Visitor sees the root page" do
    visit "/"

    expect(page).to have_content("Welcome to Idea Box")
    expect(page).to have_link("Log In")
    expect(page).to have_link("Create Account")
  end
end
