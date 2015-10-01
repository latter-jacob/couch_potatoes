class Review < ActiveRecord::Base
  belongs_to :program
  belongs_to :user
  has_many :votes

  validates :user, uniqueness: {
    scope: :program,
    message: "You may only review a program once."
  }

  validates :body, length: { maximum: 200 }, presence: true

  validates :program, presence: true
  validates :user, presence: true

  def get_score
    total = 0
    votes = self.votes
    votes.each do |vote|
      total += vote.value
    end
    total
  end

  def self.order_by_vote
    select('reviews.*, COALESCE(sum(votes.value), 0) AS score')
    .joins('LEFT JOIN votes ON votes.review_id = reviews.id')
    .group("reviews.id")
    .order("score desc")
  end

  def edited?
    created_at != updated_at
  end
end
