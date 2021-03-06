module Helpers
  def sign_in(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  def add_review(signed_in_user, program, review)
    visit program_path(program)
    click_link("Add a review")
    fill_in "review_body", with: review.body
    page.find("#submit-review-button").click
  end
end
