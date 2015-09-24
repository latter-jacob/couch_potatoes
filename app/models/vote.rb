class Vote < ActiveRecord::Base
  belongs_to :review
  belongs_to :user

  validates :user, uniqueness: { scope: :review }

  validates :vote, presence: true
  validates :vote, numericality: { only_integer: true }
  validates :vote, inclusion: { in: -1..1 }

end
