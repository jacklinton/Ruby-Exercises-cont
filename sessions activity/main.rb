require "sinatra"
require "sinatra/activerecord"
require "sinatra/flash"
require "./models"


set :database, "sqlite3:sessions.sqlite3"
enable :sessions

get "/" do 
	@posts = Post.all


	erb :index

end

post "/posts" do
	# or Post.create(title: params["title"], body: params["body"])


	post = Post.new

	post.title = params["title"]
	post.body = params["body"]
	post.user_id = session[:user_id]

	post.save

	redirect "/"
end

get "/posts/delete/:id" do
	post = Post.find(params[:id])
	post.destroy

	redirect "/"
end

get "/posts/:id" do
	@post = Post.find(params[:id])

	erb :posts_view
end

get '/posts/edit/:id' do
  @post = Post.find(params[:id])

  erb :post_edit
end

post '/posts/edit/:id' do
	@post = Post.find(params[:id])
	
	@post.title = params[:title]
	@post.body = params[:body]
	
	@post.save
	
	redirect "/posts/#{@post.id}"
end

post "/users/new" do
	user = User.create(fname: params["fname"], lname: params["lname"], email: params["email"], password: params["password"])

	session[:user_id] = user.id

	flash[:notice] = "You are now signed in with a new account!"

	redirect "/"
end

get "/sign_in" do
	erb :sign_in
end

post "/users/login" do
	
	user = User.where(email: params[:email]).first

	if user.password == params[:password]
		flash[:notice] = "You are now logged in."
		session[:user_id] = user.id
	else
		flash[:notice] = "Incorrect login credentials."
	end
	redirect "/"
end

post "/log/out" do
	session.clear

	redirect "/"
end