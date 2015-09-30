class Rate < ActiveRecord::Base
  belongs_to :rater, class_name: "User"
end
