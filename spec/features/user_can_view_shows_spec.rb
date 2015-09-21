require 'rails_helper'

feature 'user ', %(
As a user when I visit
the root page I want to
see a list of shows to review.
So that I can decide which
one to judge.

  Acceptance Criteria
  [ ] - I must see the name of each show

) do

  scenario 'user views all shows' do
    show_1 = Show.create(
      name: "Doug",
      url: "https://www.youtube.com/watch?v=JR5zFiIxqSs",
      debut_year: "1991",
      end_year: "1999",
      genre: "cartoon"
    )


    visit root_path

    expect(page).to have_content(show_1.name)
    expect(page).to have_content("Doug")
  end
end
