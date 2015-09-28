require 'rails_helper'

feature 'creater of program i want an email ', %{

} do

  scenario "review a product" do
    user = FactoryGirl.create(:user, email: "email@email.com")
    program =FactoryGirl.create(:program, user: user)

    sign_in(user)

    visit program_path(program)

    fill_in "Rating", with: "5"
    click_button "Add Review"

    expect(page).to have_content("5")
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end
