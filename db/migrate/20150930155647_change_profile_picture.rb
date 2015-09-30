class ChangeProfilePicture < ActiveRecord::Migration
  def up
    change_column :users, :profile_photo, :string, default: "couch-potato.jpg"
  end

  def down
    change_column :users, :profile_photo, :string
  end
end
