require "rails_helper"

feature 'user or admin can delete their review for a theme song', %(
  As a user I want to delete my review
  Because I'm a human and I can change my mind
) do

  # Acceptance Criteria
  # [ ] User or Admin can view delete link under comments
  # [ ] When the user submits the review, the user is directed
  #     the show page for that program
  # [ ] The page must display that the comment was deleted.
  # [ ] A flash message to indicate success
  # [ ] A flash message to indicate failure

  scenario 'user deletes a review successfully' do
    review = FactoryGirl.create(:review)

    sign_in(review.user)
    expect(page).to have_content('Signed in successfully')

    visit program_path(review.program)

    click_link("Delete Comment")

    expect(page).not_to have_content(review.body)
  end

  scenario 'admin deletes a review successfully' do
    admin = FactoryGirl.create(:user, admin: true)
    review = FactoryGirl.create(:review)

    sign_in(admin)

    expect(page).to have_content('Signed in successfully')

    visit program_path(review.program)

    expect(page).to_not have_link('Edit Comment')

    click_link("Delete Comment")

    expect(page).not_to have_content(review.body)
  end
end
