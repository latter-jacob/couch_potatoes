# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "csv"

CSV.foreach('data.csv', headers: true, header_converters: :symbol) do |row|
  genre = Genre.find_or_create_by(name: row[:genre])
  Program.create(title: row[:title],
                 url: row[:url],
                 start_year: row[:start_year],
                 end_year: row[:end_year],
                 genre: genre)
end

# next step: add seed comments and users
# add new review button
# investigate getting button to expand form

User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")
User.create!(email: "hey#{rand(1..10000000)}@gmail.com", password: "password")

19.times do |n|
  review = Review.create(rating: 5, body: Faker::Book.title, program_id: 1, user_id: n + 1)
  Vote.create(review: review, user_id: n + 1, value: 0)
end

# Review.create(rating: 5, body: Faker::Book.title, program_id: 1, user_id: 2)
# Review.create(rating: 5, body: Faker::Book.title, program_id: 1, user_id: 3)
# Review.create(rating: 5, body: Faker::Book.title, program_id: 1, user_id: 4)
# Review.create(rating: 5, body: Faker::Book.title, program_id: 1, user_id: 5)
# Review.create(rating: 5, body: Faker::Book.title, program_id: 1, user_id: 6)
# Review.create(rating: 5, body: Faker::Book.title, program_id: 1, user_id: 7)
# Review.create(rating: 5, body: Faker::Book.title, program_id: 1, user_id: 8)
# Review.create(rating: 5, body: Faker::Book.title, program_id: 1, user_id: 9)
# Review.create(rating: 5, body: Faker::Book.title, program_id: 1, user_id: 10)
# Review.create(rating: 5, body: Faker::Book.title, program_id: 1, user_id: 11)
# Review.create(rating: 5, body: Faker::Book.title, program_id: 1, user_id: 12)
# Review.create(rating: 5, body: Faker::Book.title, program_id: 1, user_id: 13)
# Review.create(rating: 5, body: Faker::Book.title, program_id: 1, user_id: 14)
# Review.create(rating: 5, body: Faker::Book.title, program_id: 1, user_id: 15)
# Review.create(rating: 5, body: Faker::Book.title, program_id: 1, user_id: 16)
# Review.create(rating: 5, body: Faker::Book.title, program_id: 1, user_id: 17)
# Review.create(rating: 5, body: Faker::Book.title, program_id: 1, user_id: 18)
# Review.create(rating: 5, body: Faker::Book.title, program_id: 1, user_id: 19)
