class Person < ActiveRecord::Base
  attr_accessible :name

  has_many :movies, :dependent => :delete_all
  has_many :books, :dependent => :delete_all
  has_many :games, :dependent => :delete_all
  has_many :musics, :dependent => :delete_all
end
