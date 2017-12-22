require 'rails_helper'

describe "When a logged in User visits new Idea form" do
  it "the User can see the form" do
    user = User.create(name: "Young",
                        email: "yjj@gmail.com",
                        password: "1234",
                        role: 0)

    visit new_user_idea_path(user)

    expect(page).to have_content("Create a New Idea")
    expect(page).to have_field("idea[body]")
    expect(page).to have_field("idea[category_id]")
    expect(page).to have_button("Create Idea")
  end
end
