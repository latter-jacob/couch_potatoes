class AddUserToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :user_id, :integer
  end
end
