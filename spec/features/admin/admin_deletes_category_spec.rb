require "rails_helper"

describe "When the Admin visits Admin Dashboard path" do
  it "the Admin can delete an existing genre"  do
    genre_1 = Genre.create!(classification: "Rock")
    genre_1 = Genre.create!(classification: "Pop")

    admin = User.create(name: "Young",
                        email: "yjj@gmail.com",
                        role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    within(:css, "div.genres") do
      click_link("Delete", match: :first)
    end
    
    expect(current_path).to eq(admin_dashboard_path)
    save_and_open_page
    expect(page).to_not have_content("#{genre_1.classification}")
    expect(page).to have_content("#{genre_2.classification}")
  end
end
