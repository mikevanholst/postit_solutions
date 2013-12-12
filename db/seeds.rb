# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do |i|
  User.create(username: "User #{i}")
end


5.times do |c|
  Category.create(name: "Category #{c}")
end


10.times do |i|
  Post.create(title: "Post#{i}", url: "www.url#{i}.com", description: "Description #{i}",
    category_ids: [1,2,3,4,5].sample, user_id: 1 )
 end

 20.times do |j|
  Comment.create(body: "Comment #{j}", post_id: (1..10).to_a.sample, user_id: 1 )
end
