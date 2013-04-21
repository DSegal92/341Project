class Book < ActiveRecord::Base
  attr_accessible :comments, :description, :genre, :rating, :title, :year, :person_id, :author_ids

  has_and_belongs_to_many :authors
  belongs_to :person
end
