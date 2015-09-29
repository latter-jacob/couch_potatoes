class Program < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  belongs_to :user
  belongs_to :genre

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :url, presence: true
  validates :url, uniqueness: true

end
