class CreateStudiosGamesTable < ActiveRecord::Migration
  def up
  	create_table :studios_games, :id => false do |t|
  		t.references :game
  		t.references :studio
  	end
  	add_index :studios_games, [:studio_id, :game_id]
  	add_index :studios_games, [:game_id, :studio_id]
  end

  def down
  	drop_table :studios_games
  end
end
