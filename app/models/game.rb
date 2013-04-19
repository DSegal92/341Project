class Game < ActiveRecord::Base
  attr_accessible :comments, :description, :genre, :rating, :title, :year
end
