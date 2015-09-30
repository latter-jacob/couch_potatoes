require "rails_helper"

feature 'user can add a new review for a theme song', %(
  As a user I can review television program theme song
  So that I can submit a rating of how much
  I enjoy it, and optionally a comment on the song!
) do

  # Acceptance Criteria
  # [ ] Users must leave a comment, less than 200 characters
  # [ ] When the user submits the review, the user review is displayed
  #     on the show page
  # [ ] A flash message to indicate success
  # [ ] A flash message to indicate failure

  scenario 'user adds a review' do
    user = FactoryGirl.create(:user)
    program_1 = FactoryGirl.create(:program)

    sign_in(user)
    expect(page).to have_content('Signed in successfully')

    visit program_path(program_1)
    fill_in "Body", with: "This is a test! Lets see if it works"

    click_button("Add Review")
    expect(page).to have_content("This is a test! Lets see if it works")
    expect(page).to have_content(user.email)
  end

  scenario 'user is not signed in and adds a review' do
    program_1 = FactoryGirl.create(:program)

    visit program_path(program_1)
    fill_in "Body", with: "Heyhey"

    click_button("Add Review")
    expect(page).to have_content(
      "You must be logged in to access this section"
    )

  end

  scenario 'user adds a review with a body longer than 200 characters' do
    user = FactoryGirl.create(:user)
    program_1 = FactoryGirl.create(:program)

    sign_in(user)
    expect(page).to have_content('Signed in successfully')

    visit program_path(program_1)
    fill_in "Body", with: "200charlol" * 21

    click_button("Add Review")
    expect(page).to have_content("Body is too long (maximum is 200 characters)")
  end

  scenario 'user submits a blank form' do
    user = FactoryGirl.create(:user)
    program_1 = FactoryGirl.create(:program)

    sign_in(user)
    expect(page).to have_content('Signed in successfully')

    visit program_path(program_1)

    click_button("Add Review")

    expect(page).to have_content("Body can't be blank")
  end
end
