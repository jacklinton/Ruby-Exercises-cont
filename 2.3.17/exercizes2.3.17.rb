class Snake
	def legs
		p "no legs"
	end
	def bites
		p "bites"
		p true
	end
end

class Corn_Snake < Snake
	def bites
		super
		p "venomous"  
		p false	
	end
end

class Viper < Snake
	def bites
		super
		p "venomous"
		p true
	end
end

rufus = Corn_Snake.new
craig = Viper.new

rufus.legs
rufus.bites

craig.legs
craig.bites