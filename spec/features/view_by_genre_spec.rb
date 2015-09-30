require "rails_helper"

feature "user", %(
As a user
I want to browse programs by genre
So that I can see shows that match my interests

  Acceptance Criteria
  [X] - User navigates to category page and sees only programs in that category

) do

  scenario "user can interact with dropdown", js: true do
    genre_1 = FactoryGirl.create(:genre)
    genre_2 = FactoryGirl.create(:genre)

    program_1 = FactoryGirl.create(:program, genre: genre_1)
    program_2 = FactoryGirl.create(:program, genre: genre_1)
    program_3 = FactoryGirl.create(:program, genre: genre_2)
    visit "/"
    click_link("Browse Genres")
    click_link(genre_1.name)

    expect(page).to have_content("#{genre_1.name} shows")
    expect(page).to have_content(program_1.title)
    expect(page).to have_content(program_2.title)
    expect(page).to_not have_content(program_3.title)
  end
end
