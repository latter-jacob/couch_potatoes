class ChangeVoteToValue < ActiveRecord::Migration
  def change
    rename_column :votes, :vote, :value
  end
end
