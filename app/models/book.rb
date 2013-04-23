class Book < ActiveRecord::Base
  attr_accessible :comments, :description, :genre, :rating, :title, :year, :person_id, :author_ids, :author_id

  has_and_belongs_to_many :authors
  belongs_to :person
end
