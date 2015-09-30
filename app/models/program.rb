class Program < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  belongs_to :user
  belongs_to :genre

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :url, presence: true
  validates :url, uniqueness: true

  def self.get_random_program(user)
    result = nil
    if user.nil?
      result = Program.all.sample
    else
      excluded_ids = user.reviews.pluck(:program_id)
      result = Program.where('id NOT IN (?)', excluded_ids).sample
    end
    unless result
      result = Program.all.sample
    end
    result
  end
end
