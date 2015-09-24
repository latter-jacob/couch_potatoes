class Vote < ActiveRecord::Base
  belongs_to :review
  belongs_to :user

  validates :user, uniqueness: { scope: :review }

  validates :value, presence: true
  validates :value, numericality: { only_integer: true }
  validates :value, inclusion: { in: -1..1 }

  def vote_value(vote_string)
    vote_value = nil
    if vote_string == "upvote"
      vote_value = 1
    elsif vote_string == "downvote"
      vote_value = -1
    elsif vote_string == "upvoted" || vote_string == "downvoted"
      vote_value == 0
    end
  end

  def vote_state
    state = {up: "", down: ""}
    if self.value == 1
      state = {up: "upvoted", down: "downvote"}
    elsif self.value == -1
      state = {up: "upvote", down: "downvoted"}
    elsif self.value == 0
      state = {up: "upvote", down: "downvote"}
    end
    return state
  end

  def update_value(vote_string)
    value = vote_value(vote_string)
    self.value = value
    self.save
  end

end
