require "rails_helper"

describe "When a logged in User visits new Idea form" do
  context "and fills in the form and submits the Idea" do
    user = create(:user)

    visit new_user_idea_path(user)

    fill_in "idea[body]", with: "Go to Sleep Early"
    
  end
end
