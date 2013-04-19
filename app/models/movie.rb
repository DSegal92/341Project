class Movie < ActiveRecord::Base
  attr_accessible :comments, :description, :genre, :rating, :tite, :year

  has_and_belongs_to_many :directors
end
