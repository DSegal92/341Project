class CreateArtistsMusicsTable < ActiveRecord::Migration
  def up
  	create_table :artists_musics, :id => false do |t|
  		t.references :music
  		t.references :artist
  	end
  	add_index :artists_musics, [:artist_id, :music_id]
  	add_index :artists_musics, [:music_id, :artist_id]
  end

  def down
  	drop_table :artists_musics
  end
end
