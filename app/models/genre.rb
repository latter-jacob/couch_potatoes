class Genre < ActiveRecord::Base
  has_many :programs

  validates :name, presence: true
  validates :name, uniqueness: true
end
