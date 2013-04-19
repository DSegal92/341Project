class CreateDirectorsMoviesTable < ActiveRecord::Migration
  def up
  	create_table :directors_movies, :id => false do |t|
  		t.references :movie
  		t.references :director
  	end
  	add_index :directors_movies, [:director_id, :movie_id]
  	add_index :directors_movies, [:movie_id, :director_id]
  end

  def down
  	drop_table :directors_movies
  end
end
