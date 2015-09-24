class Review < ActiveRecord::Base
  belongs_to :program
  belongs_to :user
  has_many :votes

  validates :user, uniqueness: {
    scope: :program,
    message: "You may only review a program once."
  }

  validates :rating, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :rating, inclusion: {
    in: 1..5,
    message: "must be between 1 - 5"
  }

  validates :body, length: { maximum: 200 }, allow_blank: true
  validates :score, presence: true
  validates :score, numericality: { only_integer: true }

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

  def edited?
    created_at != updated_at
  end
end
