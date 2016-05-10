class User < ActiveRecord::Base
	has_many :posts
	has_many :comments

	scope :leora, -> { where(username: "leora") }

	scope :frequent_user, -> do 
		users = User.all

		users.select{ |user| user.posts.count > 3 }
	end

end
