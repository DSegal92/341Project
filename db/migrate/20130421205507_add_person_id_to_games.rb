class AddPersonIdToGames < ActiveRecord::Migration
  def change
    add_column :games, :person_id, :integer
  end
end
