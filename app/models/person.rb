class Person < ActiveRecord::Base
  attr_accessible :name

  has_many :movies
  has_many :books
  has_many :games
  has_many :musics
end
