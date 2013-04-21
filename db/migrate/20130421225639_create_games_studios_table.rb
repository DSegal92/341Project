class CreateGamesStudiosTable < ActiveRecord::Migration
  def up
  	create_table :games_studios, :id => false do |t|
  		t.references :studio
  		t.references :game
  	end
  	add_index :games_studios, [:game_id, :studio_id]
  	add_index :games_studios, [:studio_id, :game_id]
  end

  def down
  	drop_table :games_studios
  end
end
