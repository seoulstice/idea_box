require "rails_helper"

describe "When a User visits category new form" do
  context "as an Admin User" do
    it "allows the Admin to see the category new form" do
      admin = User.create(name: "Young",
                          email: "yjj@gmail.com",
                          role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_category_path

      expect(page).to have_content("Welcome Admin")
      expect(page).to have_field("category[classification]")
      expect(page).to have_button("Create Category")
    end
end
