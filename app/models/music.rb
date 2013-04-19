class Music < ActiveRecord::Base
  attr_accessible :comments, :format, :genre, :rating, :title, :tracks, :year

  has_and_belongs_to_many :artists
end
