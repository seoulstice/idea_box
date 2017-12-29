require "rails_helper"

describe "When a logged in User visits new Concert form" do
  context "and fills in the form and submits the Concert" do
    it "the User's recipe is created" do
      user = User.create(name: "Young",
                          email: "yjj@gmail.com",
                          password: "1234",
                          role: 0)

      visit new_user_recipe_path(user)

      fill_in "concert[body]", with: "Go to Sleep Early"
    end

  end
end
