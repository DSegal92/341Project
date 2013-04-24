# lib/tasks/populate.rake
#require 'faker'
# Rake task to populate development database with test data
# Run it with "rake db:populate"
# See Railscast 126 and the faker website for more information

namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
	require 'faker'

    Rake::Task['db:reset'].invoke
	
	# Create user1
	user1 = Person.create!(
		:name 			=> Faker::Name.name)
	
	# Create user2
	user2 = Person.create!(
		:name			=> Faker::Name.name)
	
	# Create Andrew Bird
	andrewbird = Artist.create!(
		:name			=> "Andrew Bird")
	
	# Create album
	handsofglory = Music.create!(
		:title 			=> "Hands of Glory",
		:rating			=> 3,
		:format			=> "CD",
		:genre			=> "Indie Rock",
		:tracks			=> "Three White Horses, When that Helicopter Comes, Spirograph, Railroad Bill, Something Biblical, If I Needed You, Orpheo, Beyond the Valley of the Three White Horses",
		:year			=> 2011,
		:comments		=> "Good album",
		:person_id		=> user1.id)

		
    # Create Patrick Rothfuss
    patrickrothfuss = Author.create!(
		:name => "Patrick Rothfuss")
	  
	# Create The Name of the Wind
	nameofwind = Book.create!(
		:title 			=> "The Name of the Wind",
		:year 			=> 2007,
		:comments 		=> "Good book. Interesting plot",
		:rating			=> 5,
		:genre			=> "Fantasy",
		:description 	=> "The Name of the Wind is a fantasy novel by Patrick Rothfuss, the first book in a series called The Kingkiller Chronicle.",
		:person_id		=> user1.id,
		:author_id		=> patrickrothfuss.id)
  
	# Create Steven Spielberg
	spielberg = Director.create!(
		:name 			=> "Steven Spielberg")
		
	# Create ET
	et = Movie.create!(
		:title			=> "E.T.",
		:rating			=> 5,
		:genre			=> "Science Fiction",
		:year			=> 1982,
		:description	=> "A meek and alienated little boy finds a stranded extraterrestrial. He has to find the courage to defy the authorities to help the alien return to its home planet.",
		:comments		=> "A classic American movie.",
		:person_id		=> user1.id,
		:director_id	=> spielberg.id)
		
	
	# Create Bioware
	bioware = Studio.create!(
		:name			=> "Bioware")
		
	# Create Mass Effect
	masseffect = Game.create!(
		:title			=> "Mass Effect",
		:year			=> 2007,
		:genre			=> "RPG",
		:description	=> "The discovery of the Mass Effect changes everything.",
		:comments		=> "One of the highest rated games of all time.",
		:rating			=> 5,
		:person_id		=> user1.id,
		:studio_id		=> bioware.id)
  end
end