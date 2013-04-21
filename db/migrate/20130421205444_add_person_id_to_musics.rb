class AddPersonIdToMusics < ActiveRecord::Migration
  def change
    add_column :musics, :person_id, :integer
  end
end
