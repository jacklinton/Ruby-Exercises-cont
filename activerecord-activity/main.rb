require "sinatra"
require "sinatra/activerecord"
require "./models"

set :database, "sqlite3:test.dqlite3"

get "/" do 
	@users = User.all

	User.create(email: "newuser@email.com", birthday: Time.now)
	
	erb :index
end

get "/user" do

	@last_user = User.last

	erb :user

end