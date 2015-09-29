require "rails_helper"

feature "user", %(
As a user, when I visit '/programs/2' page
I want to see the details for the show with id 2.
So that I can judge it harshly.

  Acceptance Criteria
  [ ] - I must see the details of the program

) do

  scenario "user views details for a program" do
    program_1 = FactoryGirl.create(:program, title: "Doug")

    visit program_path(program_1.id)

    expect(page).to have_content(program_1.title)
  end
end
