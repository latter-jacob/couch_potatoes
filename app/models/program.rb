class Program < ActiveRecord::Base
  has_many :reviews, dependent: :destroy

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :url, presence: true
  validates :url, uniqueness: true

  def average
    associated_reviews = self.reviews
    submissions = associated_reviews.length
    total_points = 0.0

    associated_reviews.each do |review|
      total_points += review.rating
    end

    if submissions == 0
      average = 0
    else
      average = (total_points / submissions).round(1)
    end
  end
end
