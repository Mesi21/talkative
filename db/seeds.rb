# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

15.times do
  User.create(name: Faker::Name.name, photo: Faker::Avatar.unique.image, bio: Faker::Lorem.paragraph(sentence_count: 5), posts_counter: 0)
end

50.times do
  Post.create(author:User.find(Faker::Number.between(from: 1, to: 30)), title: Faker::Lorem.word, text: Faker::Lorem.paragraph_by_chars, comments_counter: 0, likes_counter: 0)
end

200.times do
  Comment.create(user:User.find(Faker::Number.between(from: 1, to: 30)), post_id: Faker::Number.between(from: 1, to: 50), text:Faker::Lorem.sentence)
end

350.times do
  Like.create(user:User.find(Faker::Number.between(from: 1, to: 30)), post_id: Faker::Number.between(from: 1, to: 200))
end