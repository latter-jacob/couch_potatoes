require "rails_helper"

feature 'user can search for a show', %(
  As a user I can search television program titles
) do

  scenario 'user searches' do
    FactoryGirl.create(:program, title: "Breaking Bad")
    FactoryGirl.create(:program, title: "60 minutes")
    FactoryGirl.create(:program, title: "Bad Company")

    visit root_path

    fill_in "search_bar", with: "bad"

    click_button("Search")
    expect(page).to have_content("Breaking Bad")
    expect(page).to have_content("Bad Company")
    expect(page).not_to have_content("60 minutes")
  end

end
