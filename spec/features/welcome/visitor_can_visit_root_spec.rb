require 'rails_helper'

describe 'When a Visitor visits root' do
  it "the Visitor sees the root page" do
    visit "/"

    expect(page).to have_content(".recipeBox")
  end
end
