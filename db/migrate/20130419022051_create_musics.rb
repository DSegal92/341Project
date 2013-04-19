class CreateMusics < ActiveRecord::Migration
  def change
    create_table :musics do |t|
      t.string :title
      t.integer :rating
      t.string :format
      t.string :genre
      t.text :tracks
      t.integer :year
      t.text :comments

      t.timestamps
    end
  end
end
