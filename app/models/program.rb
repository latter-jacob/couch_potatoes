class Program < ActiveRecord::Base
  has_many :reviews

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :url, presence: true
  validates :url, uniqueness: true
end
