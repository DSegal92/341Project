class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :tite
      t.integer :rating
      t.string :genre
      t.integer :year
      t.text :description
      t.text :comments

      t.timestamps
    end
  end
end
