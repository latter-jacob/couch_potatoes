class Program < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  belongs_to :user
  belongs_to :genre

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :url, presence: true
  validates :url, uniqueness: true

  def self.get_random_program(user)
    if user.nil?
      programs = Program.all
      programs.sample
    else
      user_reviews = user.reviews
      excluded_ids  = []
      user_reviews.each do |review|
        excluded_ids << review.program_id
      end
      unrated_programs = Program.where('id NOT IN (?)', excluded_ids)
      unrated_programs.sample
    end
  end
end
