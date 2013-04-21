class AddStudioIdToGames < ActiveRecord::Migration
  def change
    add_column :games, :studio_id, :integer
  end
end
