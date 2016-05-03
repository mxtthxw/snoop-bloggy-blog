# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.delete_all
Tag.delete_all
Post.delete_all
Comment.delete_all

users = []

25.times do

	users << User.create(username: Faker::Internet.user_name, password: "1", firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, email: Faker::Internet.email, age: rand(18..111))

end

@tags = []

10.times do

	@tags << Tag.create(body: Faker::Book.genre)

end

posts = []
comments = []

users.each do |x|

	4.times do
		posts << Post.create(user_id: x.id, title: Faker::Book.title, body: Faker::Lorem.paragraph, post_tags_id: @tags.sample.id, comments_on: true)
		comments << Comment.create(user_id: x.id, post_id: posts.sample.id, body: Faker::StarWars.quote)
	end

end





