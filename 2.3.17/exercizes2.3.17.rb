# class Animal
# 	attr_accessor :legs

# 	def initialize(legs)
# 		@legs = legs
# 	end
# end

# class Snake < Animal
# 	attr_accessor :bites
# 	attr_accessor :venomous

# 	def initialize(legs, bites, venomous)
# 		super(legs)
# 		@bites = bites
# 		@venomous = venomous
# 	end
# end

# class Zoo
# 	attr_accessor :exhibit
# 	attr_accessor :animals

# 	def initialize(exhibit)
# 		@exhibit = exhibit
# 		@animals = []
# 	end
# 	def exhibit

		
# 	end
# end


# corn_snake = Snake.new("none", true, false)

# viper = Snake.new("none", true, true)

# zoo = Zoo.new



# number = 100

# def reduce(num)
# 	return if num == 0
	
# 	num -= 1
# 	reduce(num)

# 	puts num
# end

#Choose your own adventure
#3 choices in the story for a total of 6 outcomes
story = Story.new
story.begin_story

class Choice
	attr_accessor :choose
	attr_accessor :question

	def initialize(choose, question)
		@choose = choose
		@question = question
	end

	def the_choice
		p question + " y/n"
		choose = gets.chomp
		return choose
	end
end

class Adventure
	attr_accessor :name

	def initialize(name)
		@name = name
	end

	def get_name
		puts "What is your name?"
		name = gets.chomp
		returns name
	end
end

class Character
	attr_accessor :character_name
	attr_accessor :fix_computer
	attr_accessor :lifts_things
	attr_accessor :carries_weapon
	attr_accessor :alive

	def initialize(character_name, fix_computer, lifts_things, carries_weapon, alive)
		@character_name, @fix_computer, @lifts_things, @carries_weapon, @alive = character_name, fix_computer, lifts_things, carries weapon, alive
	end
	alive = true
end

class Story
	attr_accessor :player
	attr_accessor :party

	dylan = Character.new("Dylan Richards", true, false, false)
	ogi = Character.new("Ogi", true, true, false)
	ai = Character.new("Allen Iverson", false, false, true)

	def initialize(player, party)
		@player = player
		@party = party
	end

	player = Adventure.new.get_name


	def begin_story
		party = []
		puts "You, " + player + "are walking alone in a dark wood."
		puts "You come across " + dylan.character_name + ", and he asks if he can walk with you."
		first_choice = Choice.new()
		first_choice.question = "Will you take " + dylan.character_name + "with you on your journey?"
		if first_choice.choose == "y"
			dylan << party
		else 
			dylan.alive = false
		end

		second_leg
	end
	def second_leg
		puts "While walking in the woods, you come across a computer that says something on the screen..."
		puts "It says 'you must fix this computer or someone will die!"
		if party.include("dylan")
			puts dylan + "quickly fixes the computer."
			puts ogi + "comes running to you from out of nowhere. He thanks you for saving him and asks if he can join you as you continue through the woods."
			second_choice = Choice.new
			second_choice.question = "Will you allow " + ogi.character_name + " to join your walking party?"
			second_choice
			if second_choice.choose == "y"
				puts ogi.charater_name + " says 'Thankyou so much. I can help you because I am super strong.'"
				party << ogi
				third_leg
			else
				puts "Ogi runs away looking very afraid."
				ogi.alive = false
				third_leg
			end
		else
			puts "You don't know how to fix the computer, so you keep walking. You hear someone screaming off in the distance..."
			ogi.alive = false
			third_leg
		end
	end
	def third_leg
		puts "You continue walking, when yo hear footsteps coming toward you..."
		puts "Suddenly, " + ai.character_name + " emerges from some bushes and asks if he can walk with you through the woods."
		third_choice = Choice.new
		third_choice.question = "Can AI walk with you?"
		third_choice
		if third_choice.choose == "y"
			puts ai.character_name + " says, 'excellent, I'm carrying a knife so I can stab things.'"
			party << ai
			fourth_leg
		else
			puts "AI flies away into the distance on a magical rainbow and you find yourself feeling a bit less safe."
			fourth_leg
		end
	end
	def fourth_leg
		puts "Suddenly, a tree falls on top of you!"
		if party.include(dylan)
			puts dylan.character_name + " says, 'I can't lift that tree!'"
		elsif party.include(ai)
			puts ai.character_name + "says, 'I ain't helping you.'"
		elsif party.include(ogi)
			puts ogi.character_name + " says, 'I can lift the tree! and he lifts the tree, saving you all... for now."	
		else
			puts "Nobody can lift the tree so you and the rest of your party die of starvation waiting for help."
			party_dies
		end

	end
	def party_dies
		puts "Everyone in your party has died, including you!"
		puts player.name + ": Deceased"
		party.each do |person|
			puts person + ": Deceased"
		end
		puts "The story is over."
		fourth_choice = Choice.new
		fourth_choice.question = "Would you like to try again?"
		fourth_choice
		if fourth_choice.choose = "y"
			story = Story.new
			story.begin_story
		else
			
		end
	end
end
