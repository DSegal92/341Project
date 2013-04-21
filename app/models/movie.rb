class Movie < ActiveRecord::Base
  attr_accessible :comments, :description, :genre, :rating, :title, :year, :person_id, :director_ids

  has_and_belongs_to_many :directors
  belongs_to :person
end
