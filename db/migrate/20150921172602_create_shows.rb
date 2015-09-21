class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.string :start_year
      t.string :end_year
      t.string :genre
    end
  end
end
