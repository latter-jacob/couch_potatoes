class RemoveRatingFromReviews < ActiveRecord::Migration
  def up
    remove_column :reviews, :rating, :integer
    change_column :reviews, :body, :string, null: false
  end

  def down
    change_column :reviews, :body, :string
    remove_column :reviews, :rating, :integer
  end
end
