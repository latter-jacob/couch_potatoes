class AddEditedToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :edited, :boolean, default: false, null: false
  end
end
