##User Story 1

As a use, when I visit the root page
I want to see a list of programs to review.
So that I can decide which one to judge.

Acceptance Criteria
  [ ] - I must see the title of each program


##User Story 2
As a user, when I visit '/programs/2' page
I want to see the details for the show with id 2.
So that I can judge it harshly.

Acceptance Criteria
  [ ] - I must see the details of the program

##User Story 3
As an administrator I am able
to add a new program,
so that the users can rate
the theme song of that program.

Acceptance Criteria

  [ ] Admins are able to verify their credentials
  [ ] Without veriried credentials admin login fails
  [ ] Admins are able to visit the create new program page
  [ ] Non admins are redirected when attempting to visit the page
  [ ] Admins are able to successfully create a new show
  [ ] With invalid form info, admins are not able to create a new

##User Story 4
As a user I can review television program theme song
So that I can submit a rating of how much
I enjoy it, and optionally a comment on the song!

Acceptance Criteria
  [ ] Users must input a rating from 1 to 5
  [ ] Users can optionally leave a comment, less than 200 characters
  [ ] When the user submits the review, the user review is displayed on the show page
  [ ] A flash message to indicate success
  [ ] A flash message to indicate failure

##User Story 5
As a user I can upvote or downvote a review
that belongs to a particular
television theme song

Acceptance Criteria
  [ ] Users can click on a button to either downvote or upvote
  [ ] User can optionally do this
  [ ] The score count appears next to the review

##User Story 6


Notes
```

  # def order_by_vote(reviews, program)
  #   id_array = []
  #   score_array = []
  #   program.reviews.each do |review|
  #     id_array << review
  #     score_array << review.get_score
  #   end
  #   hash = Hash[id_array.zip score_array]
  #   hash2 = hash.sort_by {|key,value| value}.to_h
  #   hash2.keys
  # end
```
