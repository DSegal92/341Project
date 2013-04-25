# lib/tasks/populate.rake
#require 'faker'
# Rake task to populate development database with test data
# Run it with "rake db:populate"
# See Railscast 126 and the faker website for more information

namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do

    Rake::Task['db:reset'].invoke
	
	# Create user1
	user1 = Person.create!(
		:name 			=> "Ted")
	
	# Create user2
	user2 = Person.create!(
		:name			=> "Jon")
	
	# Create Andrew Bird
	andrewbird = Artist.create!(
		:name			=> "Andrew Bird")
		
	# Create Led Zeppelin
	ledzeppelin = Artist.create!(
		:name			=> "Led Zeppelin")
		
	# Create Yeah Yeah Yeahs
	yeahyeahyeahs = Artist.create!(
		:name			=> "Yeah Yeah Yeahs")
		
	# Create Regina Spektor
	reginaspektor = Artist.create!(
		:name			=> "Regina Spektor")
	
	# Create Hands of Glory
	handsofglory = Music.create!(
		:title 			=> "Hands of Glory",
		:rating			=> 3,
		:format			=> "CD",
		:genre			=> "Indie Rock",
		:tracks			=> "Three White Horses, When that Helicopter Comes, Spirograph, Railroad Bill, Something Biblical, If I Needed You, Orpheo, Beyond the Valley of the Three White Horses",
		:year			=> 2011,
		:comments		=> "Good album",
		:person_id		=> user1.id
		:artist_id		=> andrewbird.id)
		
	# Create Led Zeppelin I
	lz1 = Music.create!(
		:title 			=> "Led Zeppelin I",
		:rating			=> 5,
		:format			=> "Record",
		:genre			=> "Classic Rock",
		:tracks			=> "Good Times Bad Times, Babe I'm Gonna Leave You, You Shook Me, Dazed and Confused, Your Time is Gonna Come, Black Mountain Side, Communication Breatkdown, I Can't Quit You Baby, How Many More Times",
		:year			=> 1969,
		:comments		=> "Launched their career",
		:person_id		=> user2.id
		:artist_id		=> ledzeppelin.id)
		
	# Create Led Zeppelin II
	lz2 = Music.create!(
		:title 			=> "Led Zeppelin II",
		:rating			=> 5,
		:format			=> "Record",
		:genre			=> "Classic Rock",
		:tracks			=> "Whole Lotta Love, What Is and What Should Never Be, The Lemon Song, Thank You, Heartbreaker, Living Loving Maid, Ramble On, Moby Disk, Bring It On Home",
		:year			=> 1969,
		:comments		=> "Cited as amongst the most influential rock albums of all time.",
		:person_id		=> user2.id
		:artist_id		=> ledzeppelin.id)
		
	# Create Led Zeppelin III
	lz3 = Music.create!(
		:title 			=> "Led Zeppelin III",
		:rating			=> 3,
		:format			=> "Record",
		:genre			=> "Classic Rock",
		:tracks			=> "Immigrant Song, Friends, Celebration Day, Since I've Been Loving You, Out on the Tiles, Gallows Pole, Tangerine, That's the Way, Bron-Y-Aur Stomp, Hats Off to (Roy) Harper",
		:year			=> 1970,
		:comments		=> "A major change from their established sound",
		:person_id		=> user2.id
		:artist_id		=> ledzeppelin.id)
		
	# Create Led Zeppelin IV
	lz4 = Music.create!(
		:title 			=> "Led Zeppelin IV",
		:rating			=> 5,
		:format			=> "Record",
		:genre			=> "Classic Rock",
		:tracks			=> "Black Dog, Rock and Roll, The Battle of Evermore, Stairway to Heaven, Misty Mountain Hop, Four Sticks, Going to California, when the Levee Breaks",
		:year			=> 1971,
		:comments		=> "Contains several all time classic rock songs.",
		:person_id		=> user2.id
		:artist_id		=> ledzeppelin.id)
		
	# Create Fever to Tell
	fevertotell = Music.create!(
		:title 			=> "Fever to Tell",
		:rating			=> 3,
		:format			=> "CD",
		:genre			=> "Garage Rock",
		:tracks			=> "Rich, Date with the Night, Man, Tick, Black Tounge, Pin, Cold Light, No No No, Maps, Y Control, Modern Romance",
		:year			=> 2003,
		:comments		=> "The band's debut album",
		:person_id		=> user1.id
		:artist_id		=> yeahyeahyeahs.id)
		
	# Create Show Your Bones
	showyourbones = Music.create!(
		:title 			=> "Show Your Bones",
		:rating			=> 4,
		:format			=> "CD",
		:genre			=> "Garage Rock",
		:tracks			=> "Gold Lion, Way Out, Fancy, Phenomena, Honeybear, Cheated Hearts, Dudley, Mysteries, The Sweets, Warrior, Turn Into",
		:year			=> 2007,
		:comments		=> "Nominated for Grammy for Best Alternative Music Album",
		:person_id		=> user1.id
		:artist_id		=> yeahyeahyeahs.id)
		
	# Create Soviet Kitsch
	sovietkitsch = Music.create!(
		:title 			=> "Soviet Kitsch",
		:rating			=> 4,
		:format			=> "CD",
		:genre			=> "Anti-folk",
		:tracks			=> "Ode to Divorce, Poor Little Rich Boy, Carbon Monoxide, The Flowers, Us, Sailor SOng, Whisper, Your Honor, Ghost of Corporate Future, Chemo Lino, Somedays",
		:year			=> 2004,
		:comments		=> "Soviet Kitsch is the major label debut and third album by American singer/songwriter Regina Spektor.",
		:person_id		=> user1.id
		:artist_id		=> reginaspektor.id)
		
	# Create Begin to Hope
	begintohope = Music.create!(
		:title 			=> "Begin to Hope",
		:rating			=> 4,
		:format			=> "CD",
		:genre			=> "Anti-folk",
		:tracks			=> "Fidelity, Better, Samson, On the Radio, Field Below, Hotel Song, Apres Moi, 20 Years of Snow, That Time, Edit, Lady, Summer in the City",
		:year			=> 2006,
		:comments		=> "Begin to Hope is the fourth album by American singer-songwriter, Regina Spektor.",
		:person_id		=> user1.id
		:artist_id		=> reginaspektor.id)
		
	# Create Far
	far = Music.create!(
		:title 			=> "Far",
		:rating			=> 4,
		:format			=> "CD",
		:genre			=> "Anti-folk",
		:tracks			=> "The Calculation, Eet, Blue Lips, Folding Chair, Machine, Laughing With, Human of the Year, Two Birds, Dance Anthem of the 80's, Genius Next Door, Wallet, One More Time with Feeling, Man of a Thousand Faces",
		:year			=> 2009,
		:comments		=> "Far is the fifth album by American alternative singer-songwriter Regina Spektor, released in Europe through Sire Records on June 22, 2009 and North America on June 23, 2009.",
		:person_id		=> user1.id
		:artist_id		=> reginaspektor.id)
		
	# Create What We Saw from the Cheap Seats
	whatwesawfromthecheapseats = Music.create!(
		:title 			=> "What We Saw from the Cheap Seats",
		:rating			=> 4,
		:format			=> "CD",
		:genre			=> "Anti-folk",
		:tracks			=> "Samll Town Moon, Oh Marcello, Don't Leave Me, Firewood, Patron Saint, How, All the Rowboats, Open, The Party, Jessica",
		:year			=> 2012,
		:comments		=> "What We Saw from the Cheap Seats is the sixth studio album by American alternative singer-songwriter Regina Spektor.",
		:person_id		=> user1.id
		:artist_id		=> reginaspektor.id)
		

    # Create Patrick Rothfuss
    patrickrothfuss = Author.create!(
		:name			 => "Patrick Rothfuss")
		
	# Create Neil Gaiman
    neilgaiman = Author.create!(
		:name 			=> "Neil Gaiman")
		
	# Create Ernest Callenbach
    ernestcallenbach = Author.create!(
		:name 			=> "Ernest Callenbach")
		
	# Create Ray Bradbury
	raybradbury = Author.create!(
		:name			=> "Ray Bradbury")
	  
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
			
	# Create The Wise Man's Fear
	wisemansfear = Book.create!(
		:title 			=> "The Wise Man's Fear",
		:year 			=> 2011,
		:comments 		=> "Not quite as compelling as the first in the series.",
		:rating			=> 4,
		:genre			=> "Fantasy",
		:description 	=> "It is the second volume in the ongoing trilogy The Kingkiller Chronicle.",
		:person_id		=> user1.id,
		:author_id		=> patrickrothfuss.id)
	  
	# Create American Gods
	americangods = Book.create!(
		:title 			=> "American Gods",
		:year 			=> 2001,
		:comments 		=> "Won Hugo and Nebula awards",
		:rating			=> 4,
		:genre			=> "Fantasy",
		:description 	=> "The central premise of the novel is that gods and mythological creatures exist because people believe in them (similar to Tulpa). Immigrants to the United States brought with them dwarves, elves, leprechauns, and other spirits and gods. However, the power of these mythological beings has diminished as people's beliefs wane. New gods have arisen, reflecting America's obsessions with media, celebrity, technology, and drugs, among others.",
		:person_id		=> user1.id,
		:author_id		=> neilgaiman.id)
	  
	# Create Ecotopia
	ecotopia = Book.create!(
		:title 			=> "Ecotopia",
		:year 			=> 1975,
		:comments 		=> "Garnered critical praise from followers of the green movement",
		:rating			=> 2,
		:genre			=> "Utopian",
		:description 	=> "Ecotopia: The Notebooks and Reports of William Weston is the seminal utopian novel by Ernest Callenbach, published in 1975. The society described in the book is one of the first ecological utopias and was influential on the counterculture, and the green movement in the 1970s and thereafter. The author himself claimed that the society he depicted in the book is not a true utopia (in the sense of a perfect society), but, while guided by intentions and values, was imperfect and in-process.",
		:person_id		=> user2.id,
		:author_id		=> ernestcallenbach.id)
		
	# Create Farenheit 451
	farenheit451 = Book.create!(
		:title 			=> "Farenheit 451",
		:year 			=> 1953,
		:comments 		=> "The book's title refers to the temperature that Bradbury understood to be the autoignition point of book paper.",
		:rating			=> 4,
		:genre			=> "Dystopian",
		:description 	=> "Fahrenheit 451 is a dystopian novel by Ray Bradbury. The novel presents a future American society where books are outlawed and firemen burn any house that contains them.",
		:person_id		=> user2.id,
		:author_id		=> raybradbury.id)
		
	# Create The Martian Chronicles
	martianchronicles = Book.create!(
		:title 			=> "The Martian Chronicles",
		:year 			=> 1950,
		:comments 		=> "A collection of short stories",
		:rating			=> 3,
		:genre			=> "Science Fiction",
		:description 	=> "The Martian Chronicles is a 1950 science fiction short story collection by Ray Bradbury that chronicles the colonization of Mars by humans fleeing from a troubled and eventually atomically devastated Earth, and the conflict between aboriginal Martians and the new colonists.",
		:person_id		=> user2.id,
		:author_id		=> raybradbury.id)
		
	# Create Something Wicked This Way Comes
	somethingwicked = Book.create!(
		:title 			=> "Something Wicked This Way Comes",
		:year 			=> 1962,
		:comments 		=> "Frequently refenece in popular culture",
		:rating			=> 3,
		:genre			=> "Fantasy Horror",
		:description 	=> "Something Wicked This Way Comes is about two 13-year-old boys, Jim Nightshade and William Halloway, who have a harrowing experience with a nightmarish traveling carnival that comes to their Midwestern town one October.",
		:person_id		=> user2.id,
		:author_id		=> raybradbury.id)
  
  
	# Create Steven Spielberg
	spielberg = Director.create!(
		:name 			=> "Steven Spielberg")
		
	# Create Michael Bay
	michaelbay = Director.create!(
		:name 			=> "Michael Bay")
		
	# Create Sam Raimi
	samraimi = Director.create!(
		:name 			=> "Sam Raimi")
		
	# Create Saving Private Ryan
	privateryan = Movie.create!(
		:title			=> "Saving Private Ryan",
		:rating			=> 3,
		:genre			=> "Epic War Film",
		:year			=> 1998,
		:description	=> "Saving Private Ryan is a 1998 American epic war film set during the invasion of Normandy in World War II.",
		:comments		=> "Critically aclaimed",
		:person_id		=> user2.id,
		:director_id	=> spielberg.id)
		
	# Create ET
	et = Movie.create!(
		:title			=> "E.T.",
		:rating			=> 5,
		:genre			=> "Science Fiction",
		:year			=> 1982,
		:description	=> "A meek and alienated little boy finds a stranded extraterrestrial. He has to find the courage to defy the authorities to help the alien return to its home planet.",
		:comments		=> "A classic American movie.",
		:person_id		=> user2.id,
		:director_id	=> spielberg.id)
		
	# Create Transformers
	transformers = Movie.create!(
		:title			=> "Transformers",
		:rating			=> 1,
		:genre			=> "Action Sci-fi",
		:year			=> 2007,
		:description	=> "Transformers is a 2007 American science fiction action film based on the Transformers toy line.",
		:comments		=> "Pretty terrible",
		:person_id		=> user1.id,
		:director_id	=> michaelbay.id)
		
	# Create Revenge of the Fallen
	revengeofthefallen = Movie.create!(
		:title			=> "Transformers: Revenge of the Fallen",
		:rating			=> 1,
		:genre			=> "Action Sci-fi",
		:year			=> 2009,
		:description	=> "Transformers: Revenge of the Fallen is a 2009 American science fiction action film directed by Michael Bay and produced by Steven Spielberg.",
		:comments		=> "Even worse than the first",
		:person_id		=> user1.id,
		:director_id	=> michaelbay.id)
		
	# Create Dark of the Moon
	darkofthemoon = Movie.create!(
		:title			=> "Transformers: Dark of the Moon",
		:rating			=> 1,
		:genre			=> "Action Sci-fi",
		:year			=> 2011,
		:description	=> "Transformers: Dark of the Moon is a 2011 American science fiction action film based on the Transformers toy line.",
		:comments		=> "Why do they keep making these?",
		:person_id		=> user1.id,
		:director_id	=> michaelbay.id)
		
	# Create The Evil Dead
	evildead = Movie.create!(
		:title			=> "The Evil Dead",
		:rating			=> 2,
		:genre			=> "Horror",
		:year			=> 1981,
		:description	=> "The Evil Dead is a 1981 American horror film written and directed by Sam Raimi, and starring Bruce Campbell, Ellen Sandweiss, and Betsy Baker.",
		:comments		=> "Major cult film",
		:person_id		=> user1.id,
		:director_id	=> samraimi.id)
		
	# Create Evil Dead II
	evildead2 = Movie.create!(
		:title			=> "Evil Dead II",
		:rating			=> 3,
		:genre			=> "Comedy Horror",
		:year			=> 1987,
		:description	=> "Evil Dead II is a 1987 American comedy horror film directed by Sam Raimi and a sequel to the 1981 film The Evil Dead.",
		:comments		=> "Major cult film",
		:person_id		=> user1.id,
		:director_id	=> samraimi.id)
		
	# Create Army of Darkness
	armyofdarkness = Movie.create!(
		:title			=> "Army of Darkness",
		:rating			=> 2,
		:genre			=> "Comedy Horror",
		:year			=> 1992,
		:description	=> "Army of Darkness is the third and final installment of The Evil Dead trilogy.",
		:comments		=> "Major cult film",
		:person_id		=> user1.id,
		:director_id	=> samraimi.id)
	
	
	# Create Bioware
	bioware = Studio.create!(
		:name			=> "Bioware")
		
	# Create EA
	ea = Studio.create!(
		:name			=> "EA")
		
	# Create Bethesda
	bethesda = Studio.create!(
		:name			=> "Bethesda")
		
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
		
	# Create Mass Effect 2
	masseffect2 = Game.create!(
		:title			=> "Mass Effect 2",
		:year			=> 2010,
		:genre			=> "Action-RPG",
		:description	=> "The game takes place within the Milky Way galaxy during the 22nd century, where humanity is threatened by an insectoid species known as the Collectors. The player assumes the role of Commander Shepard, an elite human soldier who must construct and gain the loyalty of a diverse team in order to defeat the enemy in a suicide mission.",
		:comments		=> "A more action oriented sequel.",
		:rating			=> 4,
		:person_id		=> user1.id,
		:studio_id		=> bioware.id)
		
	# Create Mass Effect 3
	masseffect3 = Game.create!(
		:title			=> "Mass Effect 3",
		:year			=> 2012,
		:genre			=> "Action-RPG",
		:description	=> "This game marks the final chapter in the Mass Effect trilogy of video games, completing the story of Commander Shepard.",
		:comments		=> "Fans didn't like the conclusion.",
		:rating			=> 4,
		:person_id		=> user1.id,
		:studio_id		=> bioware.id)
		
	# Create Madden NFL 11
	maddennfl11 = Game.create!(
		:title			=> "Madden NFL 11",
		:year			=> 2010,
		:genre			=> "Sports",
		:description	=> "It is the 24th annual installment in the bestselling Madden NFL video game franchise.",
		:comments		=> "Yet another Madden game",
		:rating			=> 2,
		:person_id		=> user2.id,
		:studio_id		=> ea.id)
		
	# Create Madden NFL 12
	maddennfl12 = Game.create!(
		:title			=> "Madden NFL 12",
		:year			=> 2011,
		:genre			=> "Sports",
		:description	=> "It is the 25th annual installment in the bestselling Madden NFL video game franchise.",
		:comments		=> "Pretty much the same as last year.",
		:rating			=> 2,
		:person_id		=> user2.id,
		:studio_id		=> ea.id)
		
	# Create Morrowind
	morrowind = Game.create!(
		:title			=> "Morrowind",
		:year			=> 2002,
		:genre			=> "Action Role-playing",
		:description	=> "The Elder Scrolls III: Morrowind is an open world fantasy action role-playing video game developed by Bethesda Game Studios, and published by Bethesda Softworks and Ubisoft.",
		:comments		=> "Started the current populatrity of the series.",
		:rating			=> 5,
		:person_id		=> user1.id,
		:studio_id		=> bethesda.id)
		
	# Create Oblivion
	oblivion = Game.create!(
		:title			=> "Oblivion",
		:year			=> 2006,
		:genre			=> "Action Role-playing",
		:description	=> "The Elder Scrolls IV: Oblivion is an action role-playing video game developed by Bethesda Game Studios and published by Bethesda Softworks and the Take-Two Interactive subsidiary 2K Games.",
		:comments		=> "Famous for its incredible horse armor DLC.",
		:rating			=> 5,
		:person_id		=> user1.id,
		:studio_id		=> bethesda.id)
		
	# Create Skyrim
	skyrim = Game.create!(
		:title			=> "Skyrim",
		:year			=> 2011,
		:genre			=> "Action Role-playing",
		:description	=> "The Elder Scrolls V: Skyrim is an action role-playing open world video game developed by Bethesda Game Studios and published by Bethesda Softworks. It is the fifth installment in The Elder Scrolls action role-playing video game series, following The Elder Scrolls IV: Oblivion.",
		:comments		=> "Dumbed down for console players",
		:rating			=> 4,
		:person_id		=> user1.id,
		:studio_id		=> bethesda.id)
  end
end