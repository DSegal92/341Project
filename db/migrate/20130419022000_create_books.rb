class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.integer :year
      t.text :comments
      t.integer :rating
      t.string :genre
      t.text :description

      t.timestamps
    end
  end
end
