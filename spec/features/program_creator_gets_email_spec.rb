require 'rails_helper'

feature 'program creator receives notification', %{

} do

  scenario "user submits a review" do
    user = FactoryGirl.create(:user, email: "email@email.com")
    program = FactoryGirl.create(:program, user: user)

    sign_in(user)

    visit program_path(program)

    fill_in "Rating", with: "5"
    click_button "Add Review"

    expect(page).to have_content("5")
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end
