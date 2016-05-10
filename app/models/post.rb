class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :tags, through: :post_tags

	scope :has_comments, -> do
		posts = Post.all
		posts.select{ |post| post.comments.count > 0 }
	end

	scope :allows_comments, -> { where(comments_on: true) }
end
