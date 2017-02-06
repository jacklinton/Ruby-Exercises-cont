require 'sinatra'
require 'rainbow'

post '/' do
 	
	 	@first_name = params['first-name']
		@last_name = params['last-name']
		"#{@first_name} #{@last_name}"
		puts "These are the params"
		puts params.inspect
		if @first_name == "jack" || @last_name == "linton"
			puts Rainbow('Welcome Jack!').gold
		else
			puts Rainbow('Nope').red
		end

end

get '/' do


		
		
	erb :index

end
