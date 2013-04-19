class Music < ActiveRecord::Base
  attr_accessible :comments, :format, :genre, :rating, :title, :tracks, :year
end
