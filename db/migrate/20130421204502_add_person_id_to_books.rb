class AddPersonIdToBooks < ActiveRecord::Migration
  def change
    add_column :books, :person_id, :integer
  end
end
