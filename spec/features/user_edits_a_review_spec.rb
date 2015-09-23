require "rails_helper"

feature 'user can edit their review for a theme song', %(
  As a user I want to edit my review
  Because I'm a human and I can change my mind
) do

  # Acceptance Criteria
  # [ ] User can navigate to the edit page from the program's show page
  # [ ] When the user submits the review, the user is directed
  #     the show page for that program
  # [ ] The page must display that the comment was edited.
  # [ ] A flash message to indicate success
  # [ ] A flash message to indicate failure


  scenario 'user edits a review successfully' do
    user = FactoryGirl.create(:user)
    program_1 = FactoryGirl.create(:program)
    review = FactoryGirl.create(
      :review,
      body: "This is a test! Lets see if it works",
      program: program_1,
      user: user
    )

    sign_in(user)
    expect(page).to have_content('Signed in successfully')

    visit program_path(program_1)

    click_link("Edit Comment")

    expect(page).to have_content("Edit Comment on #{program_1.title}")

    fill_in "Rating", with: 4
    fill_in "Body", with: "Myeah"

    click_button("Update Comment")

    expect(page).to have_content("You have updated your review")
  end

  scenario 'user edits a review successfully' do
    user_1 = FactoryGirl.create(:user)
    user_2 = FactoryGirl.create(:user)
    program_1 = FactoryGirl.create(:program)
    review = FactoryGirl.create(
      :review,
      body: "This is a test! Lets see if it works",
      program: program_1,
      user: user_1
    )

    sign_in(user_2)
    expect(page).to have_content('Signed in successfully')

    visit edit_program_review_path(program_1, review)

    expect(page).to have_content("Edit Comment on #{program_1.title}")

    fill_in "Rating", with: 4
    fill_in "Body", with: "Myeah"

    click_button("Update Comment")

    expect(page).to have_content("You must be the original author to edit!")
  end
end
