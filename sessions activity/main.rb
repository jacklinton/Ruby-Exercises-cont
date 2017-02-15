require "sinatra"
require "sinatra/activerecord"
require "sinatra/flash"
require "./models"


set :database, "sqlite3:sessions.sqlite3"
enable :sessions

get "/" do 
	@user = User.all
	@posts = Post.all

	session[:visited] = "I'm here."

	p session[:visited]

	erb :index

end

post "/posts" do
	# or Post.create(title: params["title"], body: params["body"])


	post = Post.new

	post.title = params["title"]
	post.body = params["body"]

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

get "/sign/in" do
	erb :sign_in
end

post "/users/new" do
	user = User.create(fname: params["fname"], lname: params["lname"], email: params["email"], password: params["password"])

	session[:user_id] = user.id

	redirect "/"
end

get "/sign_in" do
	erb :sign_in
end