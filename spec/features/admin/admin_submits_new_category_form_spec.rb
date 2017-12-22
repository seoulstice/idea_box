require "rails_helper"

describe "When the Admin User visits new category form" do
  it "allows the Admin to create a new category" do
    admin = User.create(name: "Young",
                        email: "yjj@gmail.com",
                        password: "1234",
                        role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_category_path

    fill_in "category[classification]", with: "chores"
    click_button "Create Category"

    expect(page).to have_content("Admin", "Categories", "Index")
    expect(page).to have_content("chores")
  end
end
