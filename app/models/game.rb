class Game < ActiveRecord::Base
  attr_accessible :comments, :description, :genre, :rating, :title, :year

  has_and_belongs_to_many :studios
end
