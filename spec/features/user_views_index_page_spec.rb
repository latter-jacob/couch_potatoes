require "rails_helper"

feature "user", %(
As a use, when I visit the root page
I want to see a list of programs to review.
So that I can decide which one to judge.

  Acceptance Criteria
  [ ] - I must see the title of each program

) do

  scenario "user views all programs", js: true do
    program_1 = FactoryGirl.create(:program, title: "Doug")

    visit root_path

    within all('.vid-link').last do
      find('.vid-image').hover
    end
    expect(page).to have_content(program_1.title)
  end
end
