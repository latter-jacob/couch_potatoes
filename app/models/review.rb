class Review < ActiveRecord::Base
  belongs_to :program
  belongs_to :user

  validates :user, uniqueness: { scope: :program,
    message: "You may only review a program once." }

  validates :rating, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :rating, inclusion: { in: 1..5,
             message: "Must be between 1 - 5" }

  validates :body, length: { maximum: 200 }, allow_blank: true
  validates :score, presence: true
  validates :score, numericality: { only_integer: true }

  validates :program, presence: true
  validates :user, presence: true
end
