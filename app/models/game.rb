class Game < ActiveRecord::Base
  attr_accessible :comments, :description, :genre, :rating, :title, :year, :person_id

  has_and_belongs_to_many :studios
  belongs_to :person
end
