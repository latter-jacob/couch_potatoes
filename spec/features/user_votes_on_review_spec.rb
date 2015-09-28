# encoding: UTF-8
require "rails_helper"

feature "user", %(
As a user
I want to vote on a review
So that I can judge it harshly.

  Acceptance Criteria
  [ ] - User must see a review to vote on
  [ ] - When User upvotes a review, User can see the score change
  [ ] - When User downvote a review, User can see the score change
  [ ] - When User clicks a vote button twice, it negates their vote

) do

  scenario "User can see a review to vote on" do
    program = FactoryGirl.create(:program, title: "Doug")
    user = FactoryGirl.create(:user)
    review = FactoryGirl.create(:review)

    sign_in(user)
    add_review(user, program, review)
    expect(page).to have_content(review.body)
  end

  scenario "When a user upvotes a review, the score changes", js: true do
    program = FactoryGirl.create(:program, title: "Doug")
    user = FactoryGirl.create(:user)
    review = FactoryGirl.create(:review)

    sign_in(user)
    add_review(user, program, review)

    page.find(".vote-up").click
    expect(page).to have_content("Review Score: 1")
  end

  scenario "When a user downvotes a review, the score changes", js: true do
    program = FactoryGirl.create(:program, title: "Doug")
    user = FactoryGirl.create(:user)
    review = FactoryGirl.create(:review)

    sign_in(user)
    add_review(user, program, review)

    page.find(".vote-down").click
    expect(page).to have_content("Review Score: -1")
  end

  scenario "When a user clicks a vote button twice, it negates their vote", js: true do
    program = FactoryGirl.create(:program, title: "Doug")
    user = FactoryGirl.create(:user)
    review = FactoryGirl.create(:review)

    sign_in(user)
    add_review(user, program, review)

    page.find(".vote-down").click
    page.find(".vote-down").click
    expect(page).to have_content("Review Score: 0")
  end
end
