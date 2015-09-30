require 'rails_helper'

feature 'creator of program receives notification', %{

} do

  scenario "user submits a review" do
    user = FactoryGirl.create(:user, email: "email@email.com")
    program = FactoryGirl.create(:program, user: user)

    sign_in(user)

    visit program_path(program)

    fill_in "Body", with: "Hinkle Dinkle"
    click_button "Add Review"

    expect(page).to have_content("Hinkle Dinkle")
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end
