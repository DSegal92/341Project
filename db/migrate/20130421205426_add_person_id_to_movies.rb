class AddPersonIdToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :person_id, :integer
  end
end
