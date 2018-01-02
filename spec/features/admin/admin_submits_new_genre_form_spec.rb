require "rails_helper"

describe "When the Admin User visits new genre form" do
  it "allows the Admin to create a new genre" do
    admin = User.create(name: "Young",
                        email: "yjj@gmail.com",
                        password: "1234",
                        role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_genre_path

    fill_in "genre[classification]", with: "Blues"
    click_button "Create Genre"

    expect(page).to have_content("Admin", "Dashboard", "Genres", "Index")
    expect(page).to have_content("Blues")
  end
end
