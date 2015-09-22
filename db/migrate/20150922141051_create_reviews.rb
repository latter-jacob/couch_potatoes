class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating, null: false
      t.string :body
      t.belongs_to :program, null: false
      t.belongs_to :user, null: false
      t.integer :score, null: false

      t.timestamps null: false
    end
  end
end
