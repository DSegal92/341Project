class FixMovieTitle < ActiveRecord::Migration
  def up
  	 rename_column :movies, :tite, :title
  end

  def down
  end
end
