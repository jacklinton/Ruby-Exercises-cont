class CreateUsersTable < ActiveRecord::Migration[5.0]
  def change
  	create_table :users do |t|
  		t.string :name
  		t.string :userId
  end
end

class CreateProfilesTable < ActiveRecord::Migration[5.0]
  def change
  	create_table :profiles do |t|
  		t.string :profile
  		t.string :user
  end
end

class CreatePostsTable < ActiveRecord::Migration[5.0]
  def change
  	create_table :posts do |t|
  		t.string :post
  		t.string :user
  end
end

class CreateUsersTable < ActiveRecord::Migration[5.0]
  def change
  	create_table :users do |t|
  		t.string :profile
  end
end