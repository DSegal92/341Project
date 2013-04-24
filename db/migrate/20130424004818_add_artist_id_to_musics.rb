class AddArtistIdToMusics < ActiveRecord::Migration
  def change
    add_column :musics, :artist_id, :integer
  end
end
