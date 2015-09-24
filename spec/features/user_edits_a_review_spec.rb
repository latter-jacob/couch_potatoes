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
    review = FactoryGirl.create(:review)

    sign_in(review.user)
    expect(page).to have_content('Signed in successfully')

    visit program_path(review.program)

    click_link("Edit Comment")

    expect(page).to have_content("Edit Comment on #{review.program.title}")

    fill_in "Rating", with: 4
    fill_in "Body", with: "Myeah"

    click_button("Update Comment")

    expect(page).to have_content("You have updated your review")
  end

  scenario 'user edits a review they do not have the right to author' do
    user_2 = FactoryGirl.create(:user)
    review = FactoryGirl.create(:review)

    sign_in(user_2)
    expect(page).to have_content('Signed in successfully')

    visit edit_program_review_path(review.program, review)

    expect(page).to have_content("Edit Comment on #{review.program.title}")

    fill_in "Rating", with: 4
    fill_in "Body", with: "Myeah"

    click_button("Update Comment")

    expect(page).to have_content("You must be the original author to edit!")
  end

  scenario 'user edits a review and average corrects itself' do
    user = FactoryGirl.create(:user)
    program = FactoryGirl.create(:program)
    review_1 = FactoryGirl.create(:review, rating: 5, program: program)
    review_2 = FactoryGirl.create(:review, user: user, rating: 3, program: program)

    sign_in(user)

    expect(page).to have_content('Signed in successfully')

    visit edit_program_review_path(program, review_2)

    fill_in "Rating", with: 2
    fill_in "Body", with: "Myeah"

    click_button("Update Comment")
    expect(page).to have_content(3.5)
  end
end
