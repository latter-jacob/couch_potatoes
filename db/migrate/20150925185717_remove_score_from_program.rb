class RemoveScoreFromProgram < ActiveRecord::Migration
  def up
    remove_column(:reviews, :score)
  end

  def down
    add_column(:reviews, :score, :integer, null: false, default: 0)
  end
end
