class Movie < ActiveRecord::Base
  attr_accessible :comments, :description, :genre, :rating, :tite, :year
end
