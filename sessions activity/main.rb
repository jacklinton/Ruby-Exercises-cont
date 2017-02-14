require "sinatra"
require "sinatra/activerecord"
require "./models"


set :database, "sqlite3:sessions.sqlite3"

get "/" do 
	@user = User.all



	erb :index

end