class Program < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  belongs_to :user

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :url, presence: true
  validates :url, uniqueness: true
  #
  # def order_by_vote(reviews)
  #   id_array = []
  #   score_array = []
  #   self.reviews.each do |review|
  #     id_array << review
  #     score_array << review.get_score
  #   end
  #   hash = Hash[id_array.zip score_array]
  #   hash2 = hash.sort_by {|key,value| value}
  #   hash2.keys
  # end
end
