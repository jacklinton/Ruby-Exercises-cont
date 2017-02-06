#1 A Calculator class

class Calculator
	
	def add(value1, value2)
		sum = (value1 + value2)
		p sum
		return sum
	end
	def subtract(value1, value2)
		subt =  (value1 - value2)
		p subt
		return subt
	end
	def multiply(value1, value2)
		mult = (value1 * value2)
		p mult
		return mult
	end
	def divide(value1, value2)
		divd = (value1 / value2)
		p divd
		return divd
	end
end

#2 The Elevator Class

class Elevator
	attr_accessor :floor

	def initialize
		@floor = 1
		p "Welcome to the first floor of our building! All visitors must check-in at the front desk. Have a great stay!"
	end
	
	def go_up
		oob_up
	end
	
	def go_down
		oob_down
	end
	
	def cheery_greeting
		puts "Welcome to floor " + @floor + ". We hope you enjoy your stay!"	
	end	
	
	def oob_up 
		if @floor == 12
			p "We're very sorry, but building areas above level 12 are prohibited for visitors. Please enjoy floors 1 through 12!"
		else
			@floor -= 1
			cheery_greeting
		end
	end
	
	def oob_down
		if @floor == 1
			p "We're very sorry, but building areas below level 1 are prohibited for visitors. Please enjoy floors 1 through 12!"	
		else
			@floor += 1
			cheery_greeting
		end
	end
end

