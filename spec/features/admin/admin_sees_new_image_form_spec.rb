require "rails_helper"

describe "When the Admin User navigate to the new image form" do
  it "the Admin User can see the form" do
    admin = User.create(name: "Young",
                        email: "yjj@gmail.com",
                        password: "1234",
                        role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_image_path

    expect(page).to have_content("Image Uploader")
    expect(page).to have_button("Upload")
    expect(page).to have_content("Name")
  end
end
