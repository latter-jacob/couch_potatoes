class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :name, null: false
    end

    add_index :genres, :name, unique: true
    remove_column :programs, :genre, :string
    add_column :programs, :genre_id, :integer
  end
end
