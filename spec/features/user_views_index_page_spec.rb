require "rails_helper"

feature "user", %(
As a use, when I visit the root page
I want to see a list of shows to review.
So that I can decide which one to judge.

  Acceptance Criteria
  [ ] - I must see the name of each show

) do

  scenario "user views all shows" do
    show_1 = FactoryGirl.create(:show, title: "Doug")

    visit root_path

    expect(page).to have_content(show_1.title)
  end
end
