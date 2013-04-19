class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.integer :year
      t.string :genre
      t.text :description
      t.text :comments
      t.integer :rating

      t.timestamps
    end
  end
end
