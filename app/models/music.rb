class Music < ActiveRecord::Base
  attr_accessible :comments, :format, :genre, :rating, :title, :tracks, :year, :person_id, :artist_ids

  has_and_belongs_to_many :artists
  belongs_to :person
end
