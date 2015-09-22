class AddDefaultValueToScore < ActiveRecord::Migration
  def up
    change_column(:reviews, :score, :integer, null: false, default: 0)
  end

  def down
    change_column(:reviews, :score, :integer, null: false)
  end
end
