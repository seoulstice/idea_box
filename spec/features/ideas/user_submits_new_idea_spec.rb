require "rails_helper"

describe "When a logged in User visits new Idea form" do
  context "and fills in the form and submits the Idea" do
    it "the User's idea is created" do
      user = User.create(name: "Young",
                          email: "yjj@gmail.com",
                          password: "1234",
                          role: 0)

      visit new_user_idea_path(user)

      fill_in "idea[body]", with: "Go to Sleep Early"
    end

  end
end
