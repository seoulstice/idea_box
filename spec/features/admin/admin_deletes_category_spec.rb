require "rails_helper"

describe "When the Admin visits Admin Categories path" do
  it "the Admin can delete an existing category"  do
    category_1 = create(:category)
    category_2 = create(:category)

    admin = User.create(name: "Young",
                        email: "yjj@gmail.com",
                        role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_categories_path

    find(".category", match: :first).click

    expect(current_path).to eq(admin_categories_path)
    expect(page).to_not have_content("#{category_1.classification}")
    expect(page).to have_content("#{category_2.classification}")
  end
end
